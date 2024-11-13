import { defineConfig } from "astro/config";

import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
	site:'https://Madian2112.github.io',
	base: '/portfolio-astro /',
	output: 'static',
	integrations: [tailwind()],
});
