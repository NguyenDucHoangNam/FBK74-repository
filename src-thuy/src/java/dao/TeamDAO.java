/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Team;
import model.TeamMember;

/**
 *
 * @author DELL
 */
public class TeamDAO extends DBContext {

    public Team getTeamById(int id) {
        String sql = "SELECT [IDTeam]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDTournament]\n"
                + "      ,[TeamName]\n"
                + "      ,[TeamDetail]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Team] where IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt("IDTeam"));
                team.setAccountID(rs.getInt("IDAccount1"));
                team.setTournamentID(rs.getInt("IDTournament"));
                team.setName(rs.getString("TeamName"));
                team.setDetail(rs.getString("TeamDetail"));
                team.setStatus(rs.getString("status"));
                return team;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Team> getAllTeam() {
        List<Team> list = new ArrayList<>();
        String sql = "SELECT [IDTeam]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDTournament]\n"
                + "      ,[TeamName]\n"
                + "      ,[TeamDetail]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Team]";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt("IDTeam"));
                team.setAccountID(rs.getInt("IDAccount1"));
                team.setTournamentID(rs.getInt("IDTournament"));
                team.setName(rs.getString("TeamName"));
                team.setDetail(rs.getString("TeamDetail"));
                team.setStatus(rs.getString("status"));
                list.add(team);
            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public List<Team> getAll(int id) {
        List<Team> list = new ArrayList<>();
        String sql = "Select te.IDTeam,te.TeamName from ScheduleTournament st join Team te on st.IDTeam1 = te.IDTeam where st.IDScheduleTournament = ?\n"
                + "union all\n"
                + "Select te.IDTeam,te.TeamName from ScheduleTournament st join Team te on st.IDTeam2 = te.IDTeam where st.IDScheduleTournament = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt(1));
                team.setName(rs.getString(2));
                team.setMembers(getAllMember(rs.getInt(1)));
                team.setStatus(rs.getString("status"));

                list.add(team);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<TeamMember> getAllMember(int id) {
        List<TeamMember> list = new ArrayList<>();
        String sql = "SELECT [IDTeamMembers]\n"
                + "      ,[IDTeam]\n"
                + "      ,[Name]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[JerseyNumber]\n"
                + "      ,[IsCaption]\n"
                + "      ,[Detail]\n"
                + "  FROM [dbo].[TeamMembers] where IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TeamMember teammember = new TeamMember();
                teammember.setId(rs.getInt("IDTeamMembers"));
                teammember.setDetail(rs.getString("Detail"));
                teammember.setName(rs.getString("Name"));
                teammember.setNumber(rs.getString("JerseyNumber"));
                teammember.setPhone(rs.getString("PhoneNumber"));

                list.add(teammember);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Team> getAllTeamByPendingApproveStatus() {
        List<Team> list = new ArrayList<>();
        String sql = "SELECT [IDTeam]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDTournament]\n"
                + "      ,[TeamName]\n"
                + "      ,[TeamDetail]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Team] where status = 2";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt(1));
                team.setAccountID(rs.getInt(2));
                team.setTournamentID(rs.getInt(3));
                team.setName(rs.getString(4));
                team.setDetail(rs.getString(5));
                team.setStatus(rs.getString(6));
                list.add(team);
            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Team> getAllTeamByPendingApproveStatusByTournamentId(int tournamentId) {
        List<Team> list = new ArrayList<>();
        String sql = "SELECT [IDTeam]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDTournament]\n"
                + "      ,[TeamName]\n"
                + "      ,[TeamDetail]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Team] where status = 2 and IDTournament = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, tournamentId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt(1));
                team.setAccountID(rs.getInt(2));
                team.setTournamentID(rs.getInt(3));
                team.setName(rs.getString(4));
                team.setDetail(rs.getString(5));
                team.setStatus(rs.getString(6));
                list.add(team);
            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Team> getAllTeamByPendingCancelStatusByTournamentId(int tournamentId) {
        List<Team> list = new ArrayList<>();
        String sql = "SELECT [IDTeam]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDTournament]\n"
                + "      ,[TeamName]\n"
                + "      ,[TeamDetail]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Team] where status = 3 and IDTournament = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, tournamentId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt(1));
                team.setAccountID(rs.getInt(2));
                team.setTournamentID(rs.getInt(3));
                team.setName(rs.getString(4));
                team.setDetail(rs.getString(5));
                team.setStatus(rs.getString(6));
                list.add(team);
            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Team> getAllTeamByPendingCancelStatus() {
        List<Team> list = new ArrayList<>();
        String sql = "SELECT [IDTeam]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDTournament]\n"
                + "      ,[TeamName]\n"
                + "      ,[TeamDetail]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Team] where status = 3";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt(1));
                team.setAccountID(rs.getInt(2));
                team.setTournamentID(rs.getInt(3));
                team.setName(rs.getString(4));
                team.setDetail(rs.getString(5));
                team.setStatus(rs.getString(6));
                list.add(team);
            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Team> getAllTeamByTournament(int id) {
        List<Team> list = new ArrayList<>();
        String sql = "SELECT [IDTeam]\n"
                + "                ,[IDAccount1]\n"
                + "                ,[IDTournament]\n"
                + "                 ,[TeamName]\n"
                + "                ,[TeamDetail]\n"
                + "                ,[status]\n"
                + "                FROM [dbo].[Team] where IDTournament = ?  AND (status = 1 or status = 3)   ";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt("IDTeam"));
                team.setAccountID(rs.getInt("IDAccount1"));
                team.setTournamentID(rs.getInt("IDTournament"));
                team.setName(rs.getString("TeamName"));
                team.setDetail(rs.getString("TeamDetail"));
                team.setStatus(rs.getString("status"));
                list.add(team);
            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Team getTeamByUserAndTournament(int id, int idTournament) {
        String sql = " SELECT [IDAccount1] \n"
                + "		 ,[IDTeam] \n"
                + "                ,[IDTournament] \n"
                + "                ,[TeamName] \n"
                + "                ,[TeamDetail] \n"
                + "                ,[status] \n"
                + "                 FROM [dbo].[Team] where IDAccount1 = ? and IDTournament = ? ";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, idTournament);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt("IDTeam"));
                team.setName(rs.getString("TeamName"));
                team.setDetail(rs.getString("TeamDetail"));
                team.setAccountID(rs.getInt("IDAccount1"));
                team.setTournamentID(rs.getInt("IDTournament"));
                team.setStatus(rs.getString("status"));
                return team;

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Team getTeamByUserAndTournamentWithActiveStatus(int id, int idTournament) {
        String sql = " SELECT [IDAccount1] \n"
                + "		 ,[IDTeam] \n"
                + "                ,[IDTournament] \n"
                + "                ,[TeamName] \n"
                + "                ,[TeamDetail] \n"
                + "                ,[status] \n"
                + "                 FROM [dbo].[Team] where IDAccount1 = ? and IDTournament = ? and (status = 1 or status = 3)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, idTournament);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Team team = new Team();
                team.setId(rs.getInt("IDTeam"));
                team.setName(rs.getString("TeamName"));
                team.setDetail(rs.getString("TeamDetail"));
                team.setAccountID(rs.getInt("IDAccount1"));
                team.setTournamentID(rs.getInt("IDTournament"));
                team.setStatus(rs.getString("status"));
                return team;

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Team> getTeamByUser(int id) {
        String sql = "SELECT [IDAccount1]\n"
                + "      ,[IDTeam]\n"
                + "      ,[IDTournament]\n"
                + "      ,[TeamName]\n"
                + "      ,[TeamDetail]\n"
                + "  FROM [dbo].[Team] where IDAccount1 = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            List<Team> list = new ArrayList<>();
            while (rs.next()) {
                Team team = new Team();

                team.setId(rs.getInt("IDTeam"));
                team.setName(rs.getString("TeamName"));
                team.setDetail(rs.getString("TeamDetail"));
                team.setAccountID(rs.getInt("IDAccount1"));
                team.setTournamentID(rs.getInt("IDTournament"));
                team.setStatus(rs.getString("status"));

                list.add(team);

            }
            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void insertTeamWithPendingStatus(Team team) {
        String sql = "INSERT INTO [dbo].[Team]\n"
                + "           ([IDAccount1]\n"
                + "           ,[IDTournament]\n"
                + "           ,[TeamName]\n"
                + "           ,[TeamDetail]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,2)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, team.getAccountID());
            st.setInt(2, team.getTournamentID());
            st.setString(3, team.getName());
            st.setString(4, team.getDetail());
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateStatusToAccepted(int id) {
        String sql = "UPDATE [dbo].[Team]\n"
                + "   SET [status] = 1\n"
                + " WHERE IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateStatusToRejected(int id) {
        String sql = "UPDATE [dbo].[Team]\n"
                + "   SET [status] = 0\n"
                + " WHERE IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateStatusToPendingApprove(int id) {
        String sql = "UPDATE [dbo].[Team]\n"
                + "   SET [status] = 2\n"
                + " WHERE IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
    }

    public void updateStatusToPendingCancel(int id) {
        String sql = "UPDATE [dbo].[Team]\n"
                + "   SET [status] = 3\n"
                + " WHERE IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
    }

    public void updateStatusToCancel(int id) {
        String sql = "UPDATE [dbo].[Team]\n"
                + "   SET [status] = 4\n"
                + " WHERE IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
    }

    public List<Integer> getDistinctTournamentIdOfOneUser(int id) {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT distinct [IDTournament]\n"
                + "  FROM [dbo].[Team] where IDAccount1 = ? and (status = 1 or status = 3)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void changeTeamStatusWhenTournamentDeleted(int id) {
        List<Integer> list = new ArrayList<>();
        String sql = "UPDATE [dbo].[Team]\n"
                + "   SET [Status] = 0\n"
                + " WHERE IDTournament = ? ";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteTeam(int id) {
        String sql = "DELETE FROM [dbo].[Team]\n"
                + "      WHERE IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<TeamMember> getTeamMembersByTeamId(int id) {
        List<TeamMember> list = new ArrayList<>();
        String sql = "SELECT [IDTeamMembers]\n"
                + "      ,[IDTeam]\n"
                + "      ,[Name]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[JerseyNumber]\n"
                + "      ,[IsCaption]\n"
                + "      ,[Detail]\n"
                + "  FROM [dbo].[TeamMembers] where IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TeamMember teammember = new TeamMember();
                teammember.setId(rs.getInt("IDTeamMembers"));
                teammember.setDetail(rs.getString("Detail"));
                teammember.setName(rs.getString("Name"));
                teammember.setNumber(rs.getString("JerseyNumber"));
                teammember.setPhone(rs.getString("PhoneNumber"));

                list.add(teammember);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public TeamMember getTeamMemberByTeamMemberId(int id) {
        String sql = "SELECT [IDTeamMembers]\n"
                + "      ,[IDTeam]\n"
                + "      ,[Name]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[JerseyNumber]\n"
                + "      ,[IsCaption]\n"
                + "      ,[Detail]\n"
                + "  FROM [dbo].[TeamMembers] where IDTeamMembers = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                TeamMember teammember = new TeamMember();
                teammember.setId(rs.getInt("IDTeamMembers"));
                teammember.setDetail(rs.getString("Detail"));
                teammember.setName(rs.getString("Name"));
                teammember.setNumber(rs.getString("JerseyNumber"));
                teammember.setPhone(rs.getString("PhoneNumber"));

                return teammember;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName());
        }
        return null;
    }

    public void updateTeamMember(TeamMember teamMember) {
        String sql = "UPDATE [dbo].[TeamMembers]\n"
                + "   SET [Name] = ?\n"
                + "      ,[PhoneNumber] = ?\n"
                + "      ,[JerseyNumber] = ?\n"
                + "      ,[Detail] = ?\n"
                + " WHERE IDTeamMembers = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, teamMember.getName());
            st.setString(2, teamMember.getPhone());
            st.setString(3, teamMember.getNumber());
            st.setString(4, teamMember.getDetail());
            st.setInt(5, teamMember.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteTeamMember(int id) {
        String sql = "DELETE FROM [dbo].[TeamMembers]\n"
                + "      WHERE IDTeamMembers = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void addTeamMember(TeamMember teamMember, int id) {
        String sql = "INSERT INTO [dbo].[TeamMembers]\n"
                + "           ([IDTeam]\n"
                + "           ,[Name]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[JerseyNumber]\n"
                + "           ,[Detail])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, teamMember.getName());
            st.setString(3, teamMember.getPhone());
            st.setString(4, teamMember.getNumber());
            st.setString(5, teamMember.getDetail());
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void addTeam(Team team) {
        String sql = "INSERT INTO [dbo].[Team]\n"
                + "           (\n"
                + "           [IDTournament]\n"
                + "           ,[TeamName]\n"
                + "           ,[TeamDetail]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
//                st.setInt(1, team.getAccountID());
            st.setInt(1, team.getTournamentID());
            st.setString(2, team.getName());
            st.setString(3, team.getDetail());
            st.setString(4, team.getStatus());
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateTeam(Team team) {
        String sql = "UPDATE [dbo].[Team]\n"
                + "   SET [IDAccount1] = ?\n"
                + "      ,[TeamName] = ?\n"
                + "      ,[TeamDetail] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE IDTeam = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, team.getAccountID());
            st.setString(2, team.getName());
            st.setString(3, team.getDetail());
            st.setString(4, team.getStatus());
            st.setInt(5, team.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void main(String[] args) {
        TeamDAO teamD = new TeamDAO();
        Team team = new Team();
        team.setDetail("abcd");
        team.setName("nhatnhat");
        team.setStatus("1");
        team.setTournamentID(11);
        teamD.addTeam(team);
    }

}
