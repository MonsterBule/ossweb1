/**
 * Created by Administrator on 2015/1/5.
 */


import java.sql.*;


public class text {
    public static void main(String[] args) {
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // 驱动的名字
        String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=oss"; // sqlServer所占用端口和所要连接的数据库名字
        String user = "sa"; // sqlServer用户名
        String password = "shinow"; // 密码啊
        try {
            Class.forName(driver); // 加载驱动`
            Connection conn = DriverManager.getConnection(url, user, password);// 建立到TestDB数据库的连接
            if (!conn.isClosed()) // 如果开着
                System.out.println("Succeeded connecting to the Database!");
            Statement statement = conn.createStatement(); // 建立sql语句的执行容器
            String sql = "select * from TMe_StockInfo";
            ResultSet rs = statement.executeQuery(sql); // 执行该sql语句，返回resultSet对象
            String name = null;
            while (rs.next()) { // 分析resultSet对象，确定用户是否存在
                name = rs.getString("Num");
                System.out.println(name);
            }
            rs.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Sorry, can't find the Driver");
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

