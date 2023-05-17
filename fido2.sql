CREATE TABLE fido2_authenticators (
    tenant_id TEXT NOT NULL REFERENCES tenants (tenant_id),
    cred_uuid TEXT NOT NULL,
    user_uuid TEXT NOT NULL,
    cred_name TEXT,
    fido2_cred_id TEXT NOT NULL,
    public_key TEXT NOT NULL,
    transports TEXT[] NOT NULL,
    rp_id TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL,
    locked_as_of TIMESTAMPTZ,
    attestation_info JSONB NOT NULL,
    auth_counter INT NOT NULL,
    PRIMARY KEY(tenant_id, cred_uuid)
);

CREATE INDEX fido2_authenticators_by_user ON fido2_authenticators (tenant_id, user_uuid);
CREATE INDEX fido2_authenticators_by_id ON fido2_authenticators (tenant_id, fido2_cred_id);

CREATE TABLE fido2_attestation_challenges (
    tenant_id TEXT NOT NULL REFERENCES tenants (tenant_id),
    challenge TEXT NOT NULL,
    user_uuid TEXT NOT NULL,
    session_pin TEXT,
    expires_at TIMESTAMPTZ NOT NULL,
    pkcc_request JSONB NOT NULL,
    server_options JSONB NOT NULL,
    PRIMARY KEY(tenant_id, challenge)
);

CREATE TABLE fido2_assertion_challenges (
    tenant_id TEXT NOT NULL REFERENCES tenants (tenant_id),
    challenge TEXT NOT NULL,
    session_pin TEXT,
    expires_at TIMESTAMPTZ NOT NULL,
    pkcg_request JSONB NOT NULL,
    server_options JSONB NOT NULL,
    PRIMARY KEY(tenant_id, challenge)
);
