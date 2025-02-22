public class FeedbackData {
    private String name;
    private String number;
    private String email;
    private String message;

    // Constructors
    public FeedbackData() {
    }

    public FeedbackData(String name, String number, String email, String message) {
        this.name = name;
        this.number = number;
        this.email = email;
        this.message = message;
    }

    // Getter and Setter methods
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
