package it.unicam.justmeetbackend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import it.unicam.justmeetbackend.databasefake.Evento;
import it.unicam.justmeetbackend.services.EventService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping("/eventi")
    public List<Evento> getAllEvents() {
        return eventService.getAllEvents();
    }

    /**
     * Restituisce l'evento dato il titolo (GET)
     * @param titolo
     * @return
     */
    @RequestMapping(value="/eventi/{titolo}", method=RequestMethod.GET)
    public List<Evento> getEventsByTitolo(@PathVariable String titolo) {
        return eventService.getEventsByName(titolo);
    }
    
    /**
     * Creare Evento (POST)
     * @param e
     */
    @RequestMapping(method = RequestMethod.POST, value="/eventi")
    public void postEvent(@RequestBody Evento e) {
        eventService.addEvent(e);
    }

    /**
     * Aggiornare evento byId
     * @param e
     * @param id
     */
    @RequestMapping(value="/eventi/{id}", method=RequestMethod.PUT)
    public void updateEvent(@RequestBody Evento e, @PathVariable String id) {
        eventService.updateEvento(id, e);
    }

    /**
     * Cancellare evento byId
     * TODO String inutile
     * @param id
     * @return
     */
    @RequestMapping(value="/eventi/{id}", method=RequestMethod.DELETE)
    public String deleteEvent(@PathVariable String id) {
            return eventService.deleteEvento(id);
    }

    @GetMapping(value="/eventi/comune/{comune}")
    public List<Evento> getEventByComune(@PathVariable String comune) {
        return eventService.getEventsByComune(comune);
    }
    // @GetMapping(value = "/eventi/preferiti/{idUtente}")
    // public List<Evento> getEventiByUser(@PathVariable String idUser) {
    //     return eventService.
    // }


}