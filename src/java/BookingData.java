import java.sql.Timestamp;

public class BookingData {
    private int id;
    private String name;
    private String number;
    private String email;
    private String pack;
    private String venue;
    private Timestamp datetime;
    private String guest;

    // Constructors
    public BookingData() {
        // Default constructor
    }

    public BookingData(String name, String number, String email,String pack,String venue, Timestamp datetime, String guest) {
        this.name = name;
        this.number = number;
        this.email = email;
        this.pack = pack;
        this.venue = venue;
        this.datetime = datetime;
        this.guest = guest;
    }

    // Getter and Setter methods
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
    
    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getPackage() {
        return pack;
    }

    public void setPackage(String pack) {
        this.pack = pack;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getGuest() {
        return guest;
    }

    public void setGuest(String guest) {
        this.guest = guest;
    }

    @Override
    public String toString() {
        return "BookingData{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", number='" + number + '\'' +
                ", email='" + email + '\'' +
                ", pack='" + pack + '\'' +
                ", venue='" + venue + '\'' +
                ", datetime=" + datetime +
                ", guest='" + guest + '\'' +
                '}';
    }
}
