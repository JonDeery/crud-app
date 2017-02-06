package com.aquent.crudapp.service;

import java.util.List;
import java.util.Map;

import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Person;

/**
 * Person operations.
 */
public interface ClientService {

    /**
     * Retrieves all of the person records.
     *
     * @return list of person records
     */
    List<Client> listClients();
    List<Person> listPeoplePerClient(Integer clientId);
    List<Person> listPeopleWithoutClient();

    /**
     * Creates a new person record.
     *
     * @param person the values to save
     * @return the new person ID
     */
    Integer createClient(Client client);

    /**
     * Retrieves a person record by ID.
     *
     * @param id the person ID
     * @return the person record
     */
    Client readClient(Integer id);

    /**
     * Updates an existing person record.
     *
     * @param person the new values to save
     */
    void updateClient(Client person);

    /**
     * Deletes a person record by ID.
     *
     * @param id the person ID
     */
    void deleteClient(Integer id);

    /**
     * Validates populated client data.
     *
     * @param person the values to validate
     * @return list of error messages
     */
    List<String> validateClient(Client person);
    
	void removePerson(Integer personId);
}
