-- assinatura premium do usuário
-- integração com pagar.me
create table
    subscriptions (
        id uuid primary key default gen_random_uuid (),
        user_id uuid not null references profiles (id) on delete cascade,
        pagarme_customer_id text,
        pagarme_sub_id text,
        plan text,
        status text,
        current_period_end timestamptz,
        created_at timestamptz default now ()
    );