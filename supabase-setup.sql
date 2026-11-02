-- Supabase → SQL Editor-এ পুরোটা পেস্ট করে Run করুন (একবারই)

create table if not exists public.site_content (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz default now()
);
alter table public.site_content enable row level security;

-- সবাই পড়তে পারবে (ওয়েবসাইট দেখানোর জন্য)
drop policy if exists "public read" on public.site_content;
create policy "public read" on public.site_content for select using (true);

-- শুধু লগইন করা ইউজার (আপনি) লিখতে পারবে
drop policy if exists "owner insert" on public.site_content;
create policy "owner insert" on public.site_content for insert to authenticated with check (true);
drop policy if exists "owner update" on public.site_content;
create policy "owner update" on public.site_content for update to authenticated using (true) with check (true);

insert into public.site_content (id, data) values ('main', '{}'::jsonb) on conflict (id) do nothing;

-- ছবি/ভিডিও আপলোডের বাকেট
insert into storage.buckets (id, name, public) values ('media', 'media', true) on conflict (id) do nothing;

drop policy if exists "media public read" on storage.objects;
create policy "media public read" on storage.objects for select using (bucket_id = 'media');
drop policy if exists "media owner insert" on storage.objects;
create policy "media owner insert" on storage.objects for insert to authenticated with check (bucket_id = 'media');
drop policy if exists "media owner update" on storage.objects;
create policy "media owner update" on storage.objects for update to authenticated using (bucket_id = 'media');
drop policy if exists "media owner delete" on storage.objects;
create policy "media owner delete" on storage.objects for delete to authenticated using (bucket_id = 'media');
