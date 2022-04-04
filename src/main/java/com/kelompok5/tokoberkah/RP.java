package com.kelompok5.tokoberkah;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class RP {
    public String formatRupiah(int value){
        DecimalFormat formater = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols simbol = formater.getDecimalFormatSymbols();

        simbol.setCurrencySymbol("Rp. ");
//        simbol.setMonetaryDecimalSeparator(',');// belakang sendiri pada format rupiah
        simbol.setGroupingSeparator('.');
        formater.setDecimalFormatSymbols(simbol);
        return formater.format(value);
    }
}
