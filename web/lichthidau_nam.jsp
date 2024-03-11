<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pyramid Tournament Bracket</title>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap");
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
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
    <div class="tournament">
      <!-- Existing Left Semifinals and Quarterfinals -->

      <div class="quarterfinals round">
        <div class="match">
          <span>Quarterfinal 1: Team 1 vs Team 2</span><span>Score: TBD</span>
        </div>
        <div class="match">
          <span>Quarterfinal 2: Team 3 vs Team 4</span><span>Score: TBD</span>
        </div>
        <div class="match">
          <span>Quarterfinal 3: Team 5 vs Team 6</span><span>Score: TBD</span>
        </div>
        <div class="match">
          <span>Quarterfinal 4: Team 7 vs Team 8</span><span>Score: TBD</span>
        </div>
      </div>
      <div class="semifinals round">
        <div class="match">
          <span>Semifinal 1: Winner QF1 vs Winner QF2</span
          ><span>Score: TBD</span>
        </div>
        <div class="match">
          <span>Semifinal 2: Winner QF3 vs Winner QF4</span
          ><span>Score: TBD</span>
        </div>
      </div>
      <!-- Final Match -->
      <div class="final round">
        <div class="match">
          <span>Final: Winner SF1 vs Winner SF2</span><span>Score: TBD</span>
        </div>
      </div>

      <!-- New Right Semifinals and Quarterfinals -->
      <div class="semifinals round">
        <div class="match">
          <span>Semifinal 3: Winner QF5 vs Winner QF6</span
          ><span>Score: TBD</span>
        </div>
        <div class="match">
          <span>Semifinal 4: Winner QF7 vs Winner QF8</span
          ><span>Score: TBD</span>
        </div>
      </div>
      <div class="quarterfinals round">
        <div class="match">
          <span>Quarterfinal 5: Team 9 vs Team 10</span><span>Score: TBD</span>
        </div>
        <div class="match">
          <span>Quarterfinal 6: Team 11 vs Team 12</span><span>Score: TBD</span>
        </div>
        <div class="match">
          <span>Quarterfinal 7: Team 13 vs Team 14</span><span>Score: TBD</span>
        </div>
        <div class="match">
          <span>Quarterfinal 8: Team 15 vs Team 16</span><span>Score: TBD</span>
        </div>
      </div>
    </div>
  </body>
</html>
