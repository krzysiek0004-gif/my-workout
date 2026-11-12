-- My Workout: uruchom ten skrypt w Supabase → SQL Editor → New query
create table if not exists public.workout_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"workouts":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.workout_data enable row level security;

create policy "Użytkownik odczytuje własne treningi"
on public.workout_data for select
to authenticated
using (auth.uid() = user_id);

create policy "Użytkownik dodaje własne treningi"
on public.workout_data for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Użytkownik zmienia własne treningi"
on public.workout_data for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
