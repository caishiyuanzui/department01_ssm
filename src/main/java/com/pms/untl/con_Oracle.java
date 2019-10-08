package com.pms.untl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class con_Oracle {


    public void oracle_connection(){
        Connection connection;
        Statement statement;
        System.out.println("正在加载数据库驱动...");
        System.out.println("Class.forName('oracle.jdbc.driver.OracleDriver');");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");//这边参数的意义，url:jdbc数据库网址 user:用户名（String类型） password:密码（String类型）[这边的数据库密码和用户名填写自己的]。同样由于getConnection方法会抛出SQLException，要使用try-catch
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            System.out.println("正在连接到数据库...");
            System.out.println("connection = DriverManager.getConnection('jdbc:oracle:thin:@localhost:1521:orcl', 'system', '123456');");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:stsys", "system", "123456");///这边参数的意义，url:jdbc数据库网址 user:用户名 password:密码。同样由于getConnection方法会抛出SQLException，要使用try-catch
            System.out.println("已连接到scott数据库！！！\n");
//            String sqlinsert = "INSERT INTO score values('1005','1005',105)";
            statement=connection.createStatement();
//            int n = statement.executeUpdate(sqlinsert);
//            System.out.println("插入成功"+n);

            //-------------------------------------------------------
//            String sql = "CREATE TABLE TESTSTUDENTD " +
//                "(    " +
//                    "SNO CHAR(6)  not null, " +
//                "    SNAME      CHAR(20) not null," +
//                "    SSEX       CHAR(2)  not null," +
//                "    SBIRTHDAY  DATE     not null," +
//                "    SPECIALITY CHAR(30)," +
//                "    SCLASS     CHAR(6)  not null," +
//                "    TC         NUMBER" +
//                    ")" ;
//            statement.execute(sql);
//            System.out.println("创建成功");

            String sql = "select *from score";
            statement.execute(sql);
            System.out.println(statement.execute(sql));

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//
//    public void create_table(){
////        oracle_connection();
//        String sql = "CREATE TABLE TESTSTUDENTS " +
//                "(    SNO        CHAR(6)  not null" +
//                "    SNAME      CHAR(20) not null," +
//                "    SSEX       CHAR(2)  not null," +
//                "    SBIRTHDAY  DATE     not null," +
//                "    SPECIALITY CHAR(30),\n" +
//                "    SCLASS     CHAR(6)  not null," +
//                "    TC         NUMBER)" ;
//        try {
//            stmt=connection.createStatement();
//            stmt.executeUpdate(sql);
//            System.out.println("插入数据成功!");
//            stmt.close();
////            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public void InsertAndSelect(){
////        oracle_connection();
//        String sqlinsert = "INSERT INTO TESTSTUDENT values('1003','张三','男'，" +
//                "TO_DATE('19970711','YYYYMMDD'),'通信','2016',88)";
//        String sqlSelect = "select *from TESTSTUDENT";
//        try {
//            stmt=connection.createStatement();
//            int n = stmt.executeUpdate(sqlinsert);
//            System.out.println("插入成功"+n);
//            stmt.execute(sqlSelect);
//            System.out.println("查询成功");
//            stmt.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
}
