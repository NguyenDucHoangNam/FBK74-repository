
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sân Bóng FBK74</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f4f4;
                margin: 20px;
                color: #333;
            }

            .table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 0.9em;
                border-radius: 5px 5px 0 0;
                overflow: hidden;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }

            .thead-dark {
                background-color: #2C3E50;
                color: #ffffff;
                text-align: left;
            }

            th, td {
                padding: 12px 15px;
            }

            tr {
                border-bottom: 1px solid #dddddd;
            }

            tr:nth-of-type(even) {
                background-color: #f2f2f2;
            }

            tr:last-of-type {
                border-bottom: 2px solid #2C3E50;
            }

            tr:hover {
                background-color: #ddd;
            }

            input[type="text"], input[type="submit"] {
                padding: 8px;
                margin: 5px 0;
                border: none;
                border-radius: 4px;
            }

            input[type="text"] {
                width: calc(100% - 22px);
            }

            input[type="submit"] {
                background-color: #2C3E50;
                color: white;
                cursor: pointer;
                width: auto;
                padding: 8px 16px;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #34495E;
            }

            form {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                align-items: center;
            }

            form td {
                display: flex;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Cầu Thủ</th>
                    <th scope="col">Số Áo</th>
                    <th scope="col">Số Điện Thoại</th>
                    <th scope="col">Mô Tả</th>

                </tr>
            </thead>
            <tbody>
                <!-- Dynamic rows will be added here -->

                <tr>
            <form action="AdminEditMemberOfTeam" method="post">
                <input type="hidden" name="id" value="${teamMember.id}"/>
                <input type="hidden" name="IDTeam" value="${IDTeam}"/>

                <td>
                    <input type="text" name="name" required value="${teamMember.name}">
                </td>
                <td><input type="text" name="number" required value="${teamMember.number}"></td>
                <td><input type="text" name="phone" required value="${teamMember.phone}"></td>
                <td><input type="text" name="detail" required value="${teamMember.detail}"></td>
                <td>
                    <input type="submit" value="Chỉnh Sửa">
                </td>
            </form>
        </tr>
    </tbody>
</table>
</body>
</html>
