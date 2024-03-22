<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.RegisteredFootballField"%>
<%@page import="model.Bill"%>
<%@page import="java.util.Random"%>
<%@page import="dao.BillDAO"%>
<%@page import="dao.RegisteredFootballFieldDAO"%>
<%@page import="vnpay.Config"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%=request.getParameter("vnp_Amount")%></label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            RegisteredFootballFieldDAO rFFD = new RegisteredFootballFieldDAO();
                            int rffID;
                            rffID = (int) session.getAttribute("rffID");
                            BillDAO billD = new BillDAO();
                            Random rand = new Random();
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Thành công");

                                    // Specify the input date format
                                    SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                                    // Specify the desired output date format
                                    SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                    try {
                                        // Parse the input date string
                                        Date date = inputDateFormat.parse(request.getParameter("vnp_PayDate"));
                                        // Format the date to the desired output format
                                        String formattedDate = outputDateFormat.format(date);

                                        //    Bill bill = new Bill(request.getParameter("vnp_TxnRef"), rFFD.getRegisteredFootballFielByID(rffID), null, null, null, null, formattedDate);
                                        Bill bill = new Bill();
                                        bill.setInvoice(request.getParameter("vnp_TxnRef"));
                                        bill.setRegisteredFootballField(rFFD.getRegisteredFootballFielByID(rffID));
                                        bill.setPaymentDate(formattedDate);
                                        billD.insertBillWithRegisteredFootballField(bill);
                                        session.removeAttribute("rffID");
                                    } catch (ParseException e) {
                                        e.printStackTrace();
                                    }
                                } else {
                                    rFFD.deleteByIDRegisteredFootballField(rffID);
                                    session.removeAttribute("rffID");
                                    out.print("Không thành công");

                                }
                            } else {
                                rFFD.deleteByIDRegisteredFootballField(rffID);
                                session.removeAttribute("rffID");
                                out.print("invalid signature");

                            }

                        %></label>                   
                </div> 
                <a href="sandadat" class="btn btn-secondary">Tiếp tục</a>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>  
    </body>
</html>
