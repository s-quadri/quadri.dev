import { defineCollection } from "astro:content";
import { glob } from "astro/loaders";
import { rssSchema } from "@astrojs/rss";

const physicalProjects = defineCollection({
  loader: glob({ pattern: "**/[^_]*.md", base: "./src/data/physical-projects" }),
  schema: rssSchema,

  //   schema: z.object({
  //     title: z.string(),
  //     description: z.string(),
  //     pubDate: z.coerce.date(),
  //     updatedDate: z.coerce.date().optional(),
  //   }),
});

const digitalProjects = defineCollection({
  loader: glob({ pattern: "**/[^_]*.md", base: "./src/data/digital-projects" }),
  schema: rssSchema,

  //   schema: z.object({
  //     title: z.string(),
  //     description: z.string(),
  //     pubDate: z.coerce.date(),
  //     updatedDate: z.coerce.date().optional(),
  //   }),
});

export const collections = { physicalProjects, digitalProjects };
