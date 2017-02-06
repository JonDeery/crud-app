package com.aquent.crudapp.data.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aquent.crudapp.data.dao.ClientDao;
import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Person;

/**
 * Spring JDBC implementation of {@link ClientDao}.
 */
public class ClientJdbcDao implements ClientDao {

    private static final String SQL_LIST_CLIENTS = "SELECT * FROM client ORDER BY company_name, client_id";
    private static final String SQL_LIST_PEOPLE_PER_CLIENT = "SELECT * FROM person WHERE client_id = ";
    private static final String SQL_LIST_PEOPLE_WITHOUT_CLIENT = "SELECT * FROM person WHERE client_id = -1";
    private static final String SQL_READ_CLIENT = "SELECT * FROM client WHERE client_id = :clientId";
    private static final String SQL_DELETE_CLIENT = "DELETE FROM client WHERE client_id = :clientId";
    private static final String SQL_REMOVE_PERSON_FROM_CLIENT = "update person set client_id = -1 where person_id = :personId";
    private static final String SQL_ADD_PERSON_TO_CLIENT = "update person set client_id = :clientId where person_id = ";
    private static final String SQL_UPDATE_CLIENT = "UPDATE client SET (company_name, website, phone_number, street_address, city, state, zip_code, mailing_street_address, mailing_city, mailing_state, mailing_zip_code)"
                                                  + " = (:companyName, :website, :phoneNumber, :streetAddress, :city, :state, :zipCode, :mailingAddress, :mailingCity, :mailingState, :mailingZipCode)"
                                                  + " WHERE client_id = :clientId";
    private static final String SQL_CREATE_CLIENT = "INSERT INTO client (company_name, website, phone_number, street_address, city, state, zip_code, mailing_street_address, mailing_city, mailing_state, mailing_zip_code)"
                                                  + " VALUES (:companyName, :website, :phoneNumber, :streetAddress, :city, :state, :zipCode, :mailingAddress, :mailingCity, :mailingState, :mailingZipCode)";

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Client> listClients() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_CLIENTS, new ClientRowMapper());
    }
    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listPeoplePerClient(Integer clientId) {
    	String sql = SQL_LIST_PEOPLE_PER_CLIENT + clientId;
        return namedParameterJdbcTemplate.getJdbcOperations().query(sql, new PersonRowMapper());
    }
    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listPeopleWithoutClient() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_PEOPLE_WITHOUT_CLIENT, new PersonRowMapper());
    }


    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Client readClient(Integer clientId) {
        return namedParameterJdbcTemplate.queryForObject(SQL_READ_CLIENT, Collections.singletonMap("clientId", clientId), new ClientRowMapper());
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deleteClient(Integer clientId) {
        namedParameterJdbcTemplate.update(SQL_DELETE_CLIENT, Collections.singletonMap("clientId", clientId));
    }
    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void removePerson(Integer personId) {
        namedParameterJdbcTemplate.update(SQL_REMOVE_PERSON_FROM_CLIENT, Collections.singletonMap("personId", personId));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updateClient(Client client) {
        namedParameterJdbcTemplate.update(SQL_UPDATE_CLIENT, new BeanPropertySqlParameterSource(client));
        if(client.getPersonWithoutClient() > -1){
        	String sql = SQL_ADD_PERSON_TO_CLIENT + client.getPersonWithoutClient();
        	Integer clientId = client.getClientId();
            namedParameterJdbcTemplate.update(sql, Collections.singletonMap("clientId", clientId));
        }
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createClient(Client client) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_CLIENT, new BeanPropertySqlParameterSource(client), keyHolder);
        return keyHolder.getKey().intValue();
    }

    /**
     * Row mapper for person records.
     */
    private static final class ClientRowMapper implements RowMapper<Client> {

        @Override
        public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
            Client client = new Client();
            client.setClientId(rs.getInt("client_id"));
            client.setCompanyName(rs.getString("company_name"));
            client.setWebsite(rs.getString("website"));
            client.setPhoneNumber(rs.getString("phone_number"));
            client.setStreetAddress(rs.getString("street_address"));
            client.setCity(rs.getString("city"));
            client.setState(rs.getString("state"));
            client.setZipCode(rs.getString("zip_code"));
            client.setMailingAddress(rs.getString("mailing_street_address"));
            client.setMailingCity(rs.getString("mailing_city"));
            client.setMailingState(rs.getString("mailing_state"));
            client.setMailingZipCode(rs.getString("mailing_zip_code"));
            
            return client;
        }
    }
    private static final class PersonRowMapper implements RowMapper<Person> {

        @Override
        public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
            Person person = new Person();
            person.setPersonId(rs.getInt("person_id"));
            person.setFirstName(rs.getString("first_name"));
            person.setLastName(rs.getString("last_name"));
            person.setEmailAddress(rs.getString("email_address"));
            person.setClient(rs.getInt("client_id"));
            return person;
        }
    }
}
