package it.unicam.justmeetbackend.databasefake;

//import java.time.*;

public class Evento
{
    private String id;
    private String titolo;
    private String desc;
    private int partecipanti;
    private Topic topic;
    private User user;

    public Evento(){};
        //Luogo luogoEvento;
        //User creatore;
        //ArrayList<User> partecipanti;
        //ArrayList<Topic> topicEvento;
    public Evento(String id, String t, String d, int partecipanti ,Topic topic, User user){
        this.id = id;
        this.titolo = t;
        this.desc = d;
        this.partecipanti = partecipanti;
        this.topic = topic;
        this.user = user;

    } 

    public String getId()
    {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getPartecipanti() {
        return partecipanti;
    }

    public void setPartecipanti(int partecipanti) {
        this.partecipanti = partecipanti;
    }
        
}