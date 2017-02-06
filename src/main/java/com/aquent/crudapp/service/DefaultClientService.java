package com.aquent.crudapp.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aquent.crudapp.data.dao.ClientDao;
import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Person;

/**
 * Default implementation of {@link clientService}.
 */
public class DefaultClientService implements ClientService {

    private ClientDao ClientDao;
    private Validator validator;

    public void setClientDao(ClientDao ClientDao) {
        this.ClientDao = ClientDao;
    }

    public void setValidator(Validator validator) {
        this.validator = validator;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Client> listClients() {
        return ClientDao.listClients();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listPeoplePerClient(Integer clientId) {
        return ClientDao.listPeoplePerClient(clientId);
    }
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listPeopleWithoutClient() {
        return ClientDao.listPeopleWithoutClient();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Client readClient(Integer id) {
        return ClientDao.readClient(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createClient(Client Client) {
        return ClientDao.createClient(Client);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updateClient(Client Client) {
        ClientDao.updateClient(Client);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deleteClient(Integer id) {
        ClientDao.deleteClient(id);
    }

    @Override
    public List<String> validateClient(Client Client) {
        Set<ConstraintViolation<Client>> violations = validator.validate(Client);
        List<String> errors = new ArrayList<String>(violations.size());
        for (ConstraintViolation<Client> violation : violations) {
            errors.add(violation.getMessage());
        }
        Collections.sort(errors);
        return errors;
    }

	@Override
	public void removePerson(Integer personId) {
		ClientDao.removePerson(personId);
		
	}
}
