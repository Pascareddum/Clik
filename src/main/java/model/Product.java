package model;

public class Product {
    private int id;
    private String name;
    private String category;
    private String brand;
    private String descr;
    private double price;
    private String image;

    public Product(){
        super();
    }

    public Product(int id,String name,String category,String brand,String descr,double price,String image){
        super();
        this.id=id;
        this.name=name;
        this.category=category;
        this.brand=brand;
        this.descr=descr;
        this.price=price;
        this.image=image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category='" + category + '\'' +
                ", brand='" + brand + '\'' +
                ", descr='" + descr + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                '}';
    }
}
