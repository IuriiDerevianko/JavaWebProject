package ua.itea.javaweb;

public class User {

    private int id;
    private String login;
    private String password;
    private String name;
    private int age;
    private String continent;
    private String gender;
    private String feedback;

    public User() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setContinent(String continent) {
        this.continent = continent;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getId() {
        return id;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getContinent() {
        return continent;
    }

    public String getGender() {
        return gender;
    }

    public String getFeedback() {
        return feedback;
    }
}