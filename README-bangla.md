# Druvo সাইট + Dashboard (ফ্রি হোস্টিং)

ফাইল: `index.html` (ওয়েবসাইট), `admin.html` (শুধু আপনার dashboard), `config.js`, `supabase-setup.sql`

## ১) Supabase (ফ্রি)
1. supabase.com-এ নতুন project বানান।
2. SQL Editor → `supabase-setup.sql`-এর পুরোটা পেস্ট করে **Run**।
3. Authentication → Users → **Add user**: আপনার email + password দিন (Auto confirm চালু রাখুন)।
4. Authentication → Sign In / Providers → **"Allow new users to sign up" বন্ধ করুন**। এটা না করলে অন্য কেউ account খুলে ফেলতে পারবে।
5. Project Settings → API থেকে **Project URL** আর **anon public key** কপি করে `config.js`-এ বসান।

## ২) GitHub Pages
1. GitHub-এ নতুন repository বানিয়ে চারটা ফাইলই আপলোড করুন।
2. Settings → Pages → Branch: `main` / root → Save।
3. সাইট: `https://ইউজারনেম.github.io/রিপো/`
   Dashboard: `.../admin.html` (লিংকটা কাউকে দেবেন না, লগইন ছাড়া কেউ কিছু বদলাতে পারে না)।

## ৩) ব্যবহার
`admin.html`-এ লগইন করে যা বদলাবেন নিজে থেকে সেভ হয় আর সাইটে লাইভ হয়ে যায়। Facebook/Instagram লিংক, বুকিং লিংক, YouTube লিংক, ছবি আপলোড সবই dashboard থেকে।
আপলোড ফাইল সর্বোচ্চ 50 MB (Supabase ফ্রি লিমিট)। বড় ভিডিওর জন্য YouTube লিংক দিন।
