package com.aquent.crudapp.data.dao;

import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Person;

import java.util.List;
import java.util.Map;

/**
 * Operations on the "person" table.
 */
public interface ClientDao {

    /**
     * Retrieves all of the person records.
     *
     * @return list of person records
     */
    List<Client> listClients();
    List<Person> listPeoplePerClient(Integer clientId);

    /**
     * Creates a new person record.
     *
     * @param person the values to save
     * @return the new person ID
     */
    Integer createClient(Client person);

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
	void removePerson(Integer personId);
	List<Person> listPeopleWithoutClient();
}
