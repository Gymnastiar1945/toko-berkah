package com.kelompok5.tokoberkah;

public class DashboardTable {
    String id, barang;

    public DashboardTable(String id, String barang) {
        this.id = id;
        this.barang = barang;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBarang() {
        return barang;
    }

    public void setBarang(String barang) {
        this.barang = barang;
    }
}
