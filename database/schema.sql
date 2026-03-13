-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.
CREATE TABLE
    public.liked_tracks (
        user_id uuid NOT NULL,
        spotify_track_id text NOT NULL,
        liked_at timestamp
        with
            time zone DEFAULT now (),
            CONSTRAINT liked_tracks_pkey PRIMARY KEY (user_id, spotify_track_id),
            CONSTRAINT liked_tracks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles (id)
    );

CREATE TABLE
    public.play_history (
        id uuid NOT NULL DEFAULT gen_random_uuid (),
        user_id uuid NOT NULL,
        spotify_track_id text NOT NULL,
        played_at timestamp
        with
            time zone DEFAULT now (),
            CONSTRAINT play_history_pkey PRIMARY KEY (id),
            CONSTRAINT play_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles (id)
    );

CREATE TABLE
    public.playlist_tracks (
        id uuid NOT NULL DEFAULT gen_random_uuid (),
        playlist_id uuid NOT NULL,
        spotify_track_id text NOT NULL,
        added_at timestamp
        with
            time zone DEFAULT now (),
            position integer,
            CONSTRAINT playlist_tracks_pkey PRIMARY KEY (id)
    );

CREATE TABLE
    public.playlists (
        id uuid NOT NULL DEFAULT gen_random_uuid (),
        user_id uuid NOT NULL,
        name text NOT NULL,
        description text,
        cover_url text,
        is_public boolean DEFAULT true,
        created_at timestamp
        with
            time zone DEFAULT now (),
            CONSTRAINT playlists_pkey PRIMARY KEY (id),
            CONSTRAINT playlists_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles (id)
    );

CREATE TABLE
    public.profiles (
        id uuid NOT NULL,
        username character varying NOT NULL UNIQUE,
        display_name text,
        avatar_url text,
        is_premium boolean DEFAULT false,
        created_at timestamp
        with
            time zone DEFAULT now (),
            CONSTRAINT profiles_pkey PRIMARY KEY (id),
            CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users (id)
    );

CREATE TABLE
    public.subscriptions (
        id uuid NOT NULL DEFAULT gen_random_uuid (),
        user_id uuid NOT NULL,
        pagarme_customer_id text,
        pagarme_sub_id text,
        plan text,
        status text,
        current_period_end timestamp
        with
            time zone,
            created_at timestamp
        with
            time zone DEFAULT now (),
            CONSTRAINT subscriptions_pkey PRIMARY KEY (id),
            CONSTRAINT subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles (id)
    );