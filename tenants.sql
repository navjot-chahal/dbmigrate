CREATE TABLE tenants (
    tenant_id TEXT NOT NULL PRIMARY KEY,
    private_api_hostname TEXT NOT NULL UNIQUE,
    public_api_hostname TEXT UNIQUE,
    config JSONB NOT NULL,
    auth_mtls_names TEXT[],
    auth_jwt_schemes JSONB
);
