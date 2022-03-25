package com.kelompok5.tokoberkah;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

public class HelloController {

    @FXML
    private TextField txtuser;

    @FXML
    private PasswordField txtpass;

    @FXML
    private Button BtnLogin;



    @FXML
    void BtnLogin(ActionEvent event) {

    }

}

////
////import javafx.fxml.FXML;
////import javafx.fxml.FXMLLoader;
////import javafx.scene.Node;
////import javafx.scene.Parent;
////import javafx.scene.Scene;
////import javafx.scene.control.Button;
////import javafx.scene.control.Label;
////import javafx.event.ActionEvent;
////import javafx.scene.control.PasswordField;
////import javafx.scene.control.TextField;
////import javafx.stage.Stage;
////
////import javax.xml.transform.Result;
////import java.io.IOException;
////import java.sql.Connection;
////import java.sql.PreparedStatement;
////import java.sql.ResultSet;
////import java.sql.SQLException;
////import java.util.logging.Level;
////import java.util.logging.Logger;
////
////public class HelloController {
////    private Stage stage;
////    private Scene scene;
////    private Parent root;
////
////    @FXML
////    private Label welcomeText;
////
////    @FXML
////    private TextField txtuser;
////
////    @FXML
////    private PasswordField txtpass;
////
////    @FXML
////    private Button Masuk;
////
////    @FXML
////    protected void onHelloButtonClick() {
////        welcomeText.setText("Welcome to JavaFX Application!");
////    }
//
////    public void Masuk (ActionEvent event) throws IOException {
////        String username = txtuser.getText().toString();
////        String password = txtpass.getText().toString();
////
////        String sql = "SELECT id_pengguna, password, tipe_anggota"
////                + " FROM anggota"
////                + " WHERE id_pengguna= ? AND password= ?";
////
////        try {
////            preparedStatement = conn.prepareStatement(sql);
////            preparedStatement.setString(1, username);
////            preparedStatement.setString(2, password);
////            resultSet = preparedStatement.executeQuery();
////            if (!resultSet.next()) {
////                System.out.println("error");
////            } else {
////                System.out.println("oke");
////            }
////        } catch (Exception ex) {
////            Logger.getLogger(HelloController.class.getName()).log(Level.SEVERE, null, ex);
////        }
////
//////        root = FXMLLoader.load(getClass().getResource("login-page.fxml"));
//////        stage = (Stage)((Node)event.getSource()).getScene().getWindow();
//////        scene = new Scene(root);
//////        stage.setScene(scene);
//////        stage.show();
////    }
////
////    Connection conn = null;
////    PreparedStatement preparedStatement;
////    ResultSet resultSet = null;
////
////    private void login() {
////        String username = txtuser.getText().toString();
////        String password = txtpass.getText().toString();
////
////        String sql = "SELECT id_pengguna, password, tipe_anggota"
////                + " FROM anggota"
////                + " WHERE id_pengguna= ? AND password= ?";
////
////        try {
////            preparedStatement = conn.prepareStatement(sql);
////            preparedStatement.setString(1, username);
////            preparedStatement.setString(2, password);
////            resultSet = preparedStatement.executeQuery();
////            if (!resultSet.next()) {
////                System.out.println("error");
////            } else {
////                System.out.println("oke");
////            }
////        } catch (Exception ex) {
////            Logger.getLogger(HelloController.class.getName()).log(Level.SEVERE, null, ex);
////        }
////    }
////}
//
//
//
//import javafx.event.ActionEvent;
//import javafx.fxml.FXML;
//import javafx.scene.control.Button;
//import javafx.scene.control.PasswordField;
//import javafx.scene.control.TextField;
//
//public class HelloController {
//
//    @FXML
//    private TextField txtuser;
//
//    @FXML
//    private PasswordField txtpass;
//
//    @FXML
//    private Button Masuk;
//
//    @FXML
//    void Masuk(ActionEvent event) {
//
//        try {
//            String sql = "SELECT id_pengguna, password, tipe_anggota"
//                    + " FROM anggota"
//                    + " WHERE id_pengguna='"+txtuser.getText()
//                    +"'AND password='"+txtpass.getText()+ "'";
//            java.sql.Connection conn=(Connection)config.configDB();
//            java.sql.PreparedStatement pst=conn.prepareStatement(sql);
//            java.sql.ResultSet rs = pst.executeQuery(sql);
//            if (rs.next()){
//                String user_tipe = rs.getString("tipe_anggota");
//                this.setVisible(false);
//                kasir.menu_kasir nama= new kasir.menu_kasir();
//                admin.menu_admin namaAdmin = new admin.menu_admin();
//                if(user_tipe.equals("admin")){
//                    namaAdmin.nama_admin.setText(rs.getString("id_pengguna"));
//                    namaAdmin.setVisible(true);
//                    this.dispose();
//                } else if (user_tipe.equals("kasir")){
//                    nama.nama_kasir.setText(rs.getString("id_pengguna"));
//
//                    nama.setVisible(true);
//                    this.dispose();
//                }
//            } else {
//                JOptionPane.showMessageDialog(null, "Username atau Password salah");
//            }
//        } catch (Exception e) {
//            JOptionPane.showMessageDialog(this, e.getMessage());
//        }
//
//
//    }
//
//}
//
