# MyVirtualIndia

A responsive virtual-neighbourhood prototype with an interactive 3D Three.js map, unique houses, searchable usernames, likes, and share links.

## Run locally
1. Install Node.js 20+.
2. In this folder run `npm install`.
3. Run `npm run dev` and open the local URL shown by Vite.

## Enable shared online houses (Supabase)
Without Supabase, the app works in demo mode and saves houses/likes in this browser's local storage. To share one common world across devices:
1. Create a free project at https://supabase.com.
2. Open the SQL Editor and run `supabase.sql`.
3. Copy the Project URL and anon/public key into a new `.env` file using `.env.example`.
4. Restart `npm run dev`.

The supplied SQL is an MVP policy set. Before a public launch, add authentication, rate limiting, anti-spam checks, and server-side like tracking. The demo mode is not a global shared database.

## Deploy
Push the folder to GitHub and import it into Vercel or Netlify. Add the two `VITE_SUPABASE_*` environment variables in the hosting dashboard if using Supabase. Do not put a Supabase service-role key in frontend code.

## Instagram sharing
The Share button uses the device share sheet when available and otherwise copies a public house URL. Instagram does not allow a website to automatically publish a post to someone's account; the user chooses Instagram from the share sheet or copies the link.
