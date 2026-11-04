-- Run this in Supabase SQL Editor.
create table if not exists public.houses (
  id uuid primary key default gen_random_uuid(),
  username text not null unique,
  display_name text not null,
  city text not null default 'Virtual India',
  bio text not null default '',
  house_style text not null default 'Lotus',
  color text not null default '#f2a65a',
  x double precision not null,
  z double precision not null,
  likes integer not null default 0,
  created_at timestamptz not null default now()
);

alter table public.houses enable row level security;

create policy "Anyone can view houses" on public.houses
  for select using (true);

create policy "Anyone can create a house" on public.houses
  for insert with check (
    length(username) between 3 and 24
    and username ~ '^[a-zA-Z0-9_]+$'
    and length(display_name) between 1 and 40
  );

-- MVP demo likes. For production, replace with authenticated per-user likes
-- and a server-side RPC to prevent repeated likes.
create policy "Anyone can update likes" on public.houses
  for update using (true) with check (likes >= 0);
