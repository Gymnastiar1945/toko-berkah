package com.kelompok5.tokoberkah;

public class barang {
        int no,qty,harga;
        String nama_barang,jenis;

    public barang(int no, int qty, int harga, String nama_barang, String jenis) {
        this.no = no;
        this.qty = qty;
        this.harga = harga;
        this.nama_barang = nama_barang;
        this.jenis = jenis;
    }

    public int getNo() {
        return no;
    }

    public int getQty() {
        return qty;
    }

    public int getHarga() {
        return harga;
    }

    public String getNama_barang() {
        return nama_barang;
    }

    public String getJenis() {
        return jenis;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }

    public void setNama_barang(String nama_barang) {
        this.nama_barang = nama_barang;
    }

    public void setJenis(String jenis) {
        this.jenis = jenis;
    }
}
