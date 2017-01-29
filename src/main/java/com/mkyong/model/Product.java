package com.mkyong.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by Alexey on 20.01.2017.
 */
public class Product {
    private int barcode;
    private String name;
    private double price;
    private String description;
    private String releaseDate;



    public int getBarcode() {
        return barcode;
    }

    public void setBarcode(int barcode) {
        this.barcode = barcode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate)  {
        this.releaseDate = releaseDate;

    }

    @Override
    public String toString() {
        return "price: " + price + "barcode = " + barcode + "date=" + releaseDate;
    }
}
