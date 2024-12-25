/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./src/**/*.{html,js}",
    "../src/**/*.{html,js}",
    "../assets/**/*.{html,js}",
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/line-clamp'),
  ],
}

// TODO the current setup with postcss is getting a bit complex
// I want to watch all the content folders for changes,
// but postcss is likely not aware of them.
// Probably just need the tailwind CLI and no other bull.
