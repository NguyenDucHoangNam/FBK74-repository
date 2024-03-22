<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sân Bóng FBK74</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
            rel="stylesheet"
            />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap");

            .vongbang {
                font-family: "Roboto", sans-serif;
                margin: 0;
                padding: 0;
                background: linear-gradient(135deg, #ece9e6, #ffffff);
                background-attachment: fixed;
                background-size: cover;
            }

            .schedule-container1 {
                width: 80%;
                margin: 20px auto;
                background-color: #fff;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
            }

            .date1 {
                background-color: #007bff;
                color: #fff;
                padding: 10px;
                text-align: center;
                font-weight: bold;
                background: linear-gradient(135deg, #007bff, #004785);
            }

            .match1 {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px;
                border-bottom: 2px solid #ccc;
                transition: background-color 0.3s;
            }

            .match1:hover {
                background-color: #f9f9f9;
            }

            .time,
            .team,
            .score,
            .group {
                border: 1px solid #000;
                padding: 10px;
                text-align: center;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .team {
                flex-grow: 1;
                margin: 0 10px;
            }

            .score {
                margin: 0 15px;
                font-weight: bold;
                color: red;
            }

            .group {
                width: 100px;
                background-color: #007bff;
                color: #fff;
                border: none;
            }
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            @media (max-width: 768px) {
                .schedule-container1 {
                    width: 95%;
                }

                .match1 {
                    flex-direction: column;
                    text-align: center;
                    animation: fadeInUp 0.5s ease-out forwards;
                }

                .team,
                .time,
                .score,
                .group {
                    margin: 5px 0;
                }
            }
            .vongloai {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #007bff;
                margin: 0;
                padding: 0;
                /*background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);*/
                font-family: "Roboto", sans-serif;
            }

            .tournament {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .round {
                display: flex;
                justify-content: center;
                gap: 20px;
            }

            .match {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
                margin: 15px 0;
                width: 300px; /* Adjust width as needed */
                transition: all 0.3s ease;
                /* transition: background-color 0.3s ease; */
                position: relative;
            }

            .match:hover {
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
                transform: translateY(-5px);
                border-color: rgba(255, 255, 255, 0.5);
            }

            .match span:first-child {
                display: block;
                font-size: 1.1em;
                color: #333;
                margin-bottom: 10px;
                font-weight: 600;
            }

            .match span:last-child {
                font-size: 1.2em;
                color: #d24d57;
                font-weight: 700;
            }

            .semifinals {
                width: 80%;
                justify-content: space-around;
            }

            .quarterfinals {
                width: 100%;
                justify-content: space-between;
            }

            /* Styling for the final match */
            .final .match {
                background-color: #ffd700;
                color: #fff;
                font-weight: 700;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            /* Adding a slight rotation for visual effect */
            .final .match:before {
                content: "";
                position: absolute;
                top: 50%;
                left: 50%;
                width: 140%;
                height: 140%;
                background-color: #ffd700;
                border-radius: 10px;
                z-index: -1;
                transform: translate(-50%, -50%) rotate(3deg);
                transition: transform 0.3s ease;
            }

            .final .match:hover:before {
                transform: translate(-50%, -50%) rotate(0deg);
            }

            @media (max-width: 768px) {
                .match {
                    width: 90%;
                }
                .final .match {
                    width: 90%;
                    margin: 0 auto;
                }
                .semifinals,
                .quarterfinals {
                    width: 100%;
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <div class="vongbang">
            <h2 style="text-align: center; margin-top: 20px">
                Lịch thi đấu vòng bảng
            </h2>
            <div class="schedule-container1">
                <div class="date1">Ngày 8/3/2023</div>

                <div class="match1">
                    <div class="time">9:30 - 11:00</div>
                    <div class="team">Barcelona</div>
                    <div class="score">3-0</div>
                    <div class="team">Real Madrid</div>
                    <div class="group">Bảng A</div>
                    <div class="group">Sân 1</div>
                </div>
                <div class="match1">
                    <div class="time">9:30 - 11:00</div>
                    <div class="team">Barcelona</div>
                    <div class="score">3-0</div>
                    <div class="team">Real Madrid</div>
                    <div class="group">Bảng A</div>
                    <div class="group">Sân 1</div>
                </div>
                <!-- Add more match divs as needed -->

                <div class="date1">Ngày 9/3/2023</div>
                <div class="match1">
                    <div class="time">9:30 - 11:00</div>
                    <div class="team">Barcelona</div>
                    <div class="score">3-0</div>
                    <div class="team">Real Madrid</div>
                    <div class="group">Bảng A</div>
                    <div class="group">Sân 1</div>
                </div>
                <div class="match1">
                    <div class="time">9:30 - 11:00</div>
                    <div class="team">Barcelona</div>
                    <div class="score">3-0</div>
                    <div class="team">Real Madrid</div>
                    <div class="group">Bảng A</div>
                    <div class="group">Sân 1</div>
                </div>
                <!-- Repeat match divs for the next date -->
            </div>
        </div>
        <div class="vongloai">
            <div class="tournament">
                <!-- Existing Left Semifinals and Quarterfinals -->
                <h2 style="text-align: center; margin-top: 20px">
                    Lịch thi đấu vòng loại trực tiếp
                </h2>
                <div class="quarterfinals round">
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>

                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                </div>
                <div class="semifinals round">
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                </div>
                <!-- Final Match -->
                <div class="final round">
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                </div>

                <!-- New Right Semifinals and Quarterfinals -->
                <div class="semifinals round">
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                </div>
                <div class="quarterfinals round">
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                    <div class="match">
                        <span>Quarterfinal 1: Team 1 vs Team 2</span>
                        <div class="match-details">
                            <span>Field: Sân 2</span>
                            <span>Date: 10/3/2023</span>
                            <span>Time: 14:00 - 15:30</span>
                            <span>Score: TBD</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
