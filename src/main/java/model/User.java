package model;


public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String birthday;
    private String surname;
    private boolean admin;

    public User(){
        super();
    }

    public User(int id,String name,String surname,String birthday, String email,String password,Boolean admin){
        super();
        this.id=id;
        this.name=name;
        this.surname=surname;
        this.birthday=birthday;
        this.email=email;
        this.password=password;
        this.admin=admin;
    }

    public int getId(){
        return id;
    }

    public void setId(int id){
        this.id=id;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name= this.name;
    }

    public String getSurname() {return surname;}

    public void setSurname(String surname) {this.surname = surname;}

    public String getBirthday() {return birthday;}

    public void setBirthday(String birthday) {this.birthday = birthday;}

    public String getEmail(){
        return email;
    }

    public void setEmail(String email) {
        this.email=email;
    }

    public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password=password;
    }

    public boolean isAdmin() {return admin;}

    public void setAdmin(boolean admin) {this.admin = admin;}
}
