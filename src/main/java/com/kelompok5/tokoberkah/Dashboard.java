package com.kelompok5.tokoberkah;

import com.mysql.jdbc.Connection;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.Pane;

import java.net.URL;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;


public class Dashboard extends App implements Initializable {

    @FXML
    private Button btndtlTrans;

    @FXML
    private Button btndtlPendapatan;

    @FXML
    private Button btndtlpengeluaran;

    @FXML
    private Button btnStokbrg;

    @FXML
    private Label lblTrans;

    @FXML
    private Label lblPendapatan;

    @FXML
    private Label lblPengeluaran;

    @FXML
    private Label lblStokbrg;

    @FXML
    private Pane paneBarang;



    @FXML
    private TableView<barang> table_dashboard;

    @FXML
    private TableColumn<barang, Integer> no;

    @FXML
    private TableColumn<barang, String> nama_barang;

    @FXML
    private TableColumn<barang, String> jenis;

    @FXML
    private TableColumn<barang, Integer> qty;

    @FXML
    private TableColumn<barang, Integer> harga;

    ObservableList<barang>list = FXCollections.observableArrayList(
            new barang(1,100,100,"beras","barcode"),
            new barang(2,100,10000, "sarung","barcode" )
    );

    //seng ruwet
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
    Trans();
    Pendapatan();
table();
        hidePade();

    }


    //code here
//    void label() {
//        lblTrans.setText("ststtsts");
//    }

    private void Trans () {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime tanggal = LocalDateTime.now();
        String a = (dtf.format(tanggal));
        try {
            String sql = "SELECT count(id_penjualan) as total from penjualan "
                    + "where tanggal_tranksaksi='"+a+"' ;";
            java.sql.Connection conn=(Connection)Config.configDB();
            java.sql.PreparedStatement pst=conn.prepareStatement(sql);
            java.sql.ResultSet rs = pst.executeQuery(sql);
            rs.next();
            lblTrans.setText(rs.getString("total"));

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void Pendapatan () {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM");
        LocalDateTime tanggal = LocalDateTime.now();
        String a = (dtf.format(tanggal));
        try {
            String sql = "SELECT sum(total_bayar) as total from penjualan "
                    + "where tanggal_tranksaksi between '2021-01-01' and '2022-01-01'";
            java.sql.Connection conn=(Connection)Config.configDB();
            java.sql.PreparedStatement pst=conn.prepareStatement(sql);
            java.sql.ResultSet rs = pst.executeQuery(sql);
            rs.next();
            RP rupiah   = new RP();
            lblPendapatan.setText(rupiah.formatRupiah((int) rs.getDouble("total")).replace(".00", "").replace(",","."));

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void table(){

        no.setCellValueFactory(new PropertyValueFactory<barang, Integer>("no"));
        qty.setCellValueFactory(new PropertyValueFactory<barang, Integer>("qty"));
        harga.setCellValueFactory(new PropertyValueFactory<barang, Integer>("harga"));
        nama_barang.setCellValueFactory(new PropertyValueFactory<barang, String>("nama_barang"));
        jenis.setCellValueFactory(new PropertyValueFactory<barang, String>("jenis"));

        table_dashboard.setItems(list);
    }

    public void hidePade(){
        paneBarang.setVisible(false);
    }

}

