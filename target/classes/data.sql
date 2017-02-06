INSERT INTO person (
    first_name,
    last_name,
    email_address,
    street_address,
    city,
    state,
    zip_code,
    client_id
) VALUES (
    'John',
    'Smith',
    'fake1@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    0
), (
    'Jane',
    'Smith',
    'fake2@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    1
);

INSERT INTO client (
    company_name,
    website,
    phone_number,
    street_address,
    city,
    state,
    zip_code,
    mailing_street_address,
    mailing_city,
    mailing_state,
    mailing_zip_code
) VALUES (
    'Pepsi Co',
    'http://www.pepsi.com',
    '123-123-1234',
    '456 Smith Ave.',
    'Boston',
    'MA',
    '01516',
    '456 Smith Ave.',
    'Boston',
    'MA',
    '01516'
), (
    'Chevrolet',
    'http://www.chevy.com',
    '508-412-1234',
    '458 Smith Ave.',
    'Boston',
    'MA',
    '01516',
    '458 Smith Ave.',
    'Boston',
    'MA',
    '01516'
);

