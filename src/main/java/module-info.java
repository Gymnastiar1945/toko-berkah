module com.kelompok5.tokoberkah {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires org.kordamp.bootstrapfx.core;
    requires java.sql;
    requires mysql.connector.java;
    requires javafx.graphics;

    opens com.kelompok5.tokoberkah to javafx.fxml;
    exports com.kelompok5.tokoberkah;
}