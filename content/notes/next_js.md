+++

title = "Principled GraphQL"
template = "notes.html"
description = "Integrity, Agility & Operations Principles"
draft = true

+++

On a website we can have 2 kinds of pages:

- Pages that do not need any data from the server
- Dynamic pages that need to fetch data before rendering

The first kind of page does not need anything special to “exist”.

But if you need a page to get data from a database or the network, for example,
you’ll need to add a function to your page components called `getServerSideProps`.

## `getServerSideProps`

Note that Next.js will first render a page without the data, and then when the data becomes available
it will add the data to the page. This gives you the option to send the user a skeleton of the page
quickly, but then the user will see a “loading..” screen until the data is ready.

```
export async function getServerSideProps() {
  const res = await fetch(`https://dog.ceo/api/breeds/image/random`)
  const data = await res.json()
  return {
    props: { 
			image: data.message 
		}
  }
}
```

If it’s possible (it depends on what you’re trying to do), it’s more efficient to load this data from the browser, **client-side**. 

The browser will load the page faster, and we don’t have to use (and pay for) a server.

NOTE: as discussed when I introduced useEffect previously, in React 18 (which was released right when the bootcamp started, good timing) the default behavior of useEffect changed to run it 2 times just in development mode and just in strict mode. It just runs once in production mode and when the app is not in "strict mode". Strict mode is enabled by default so you can disable it in Next.js following https://nextjs.org/docs/api-reference/next.config.js/react-strict-mode.
In other words, if you see the image change it’s not a problem of your code - it’s how things work. But you can turn off this behavior by disabling strict mode.

## Static Data Fetching

We talked about data fetching when a user visits a page, both in the backend and in the frontend.
Next.js also offers another way. It’s called **static data fetching**.

Suppose you have a blog. You have a set of blog posts, perhaps published on a service like Contentful or Sanity. Or on a headless Wordpress install.
You can tell Next.js to fetch that content at build time, and generate static pages that are then served to the user without further action.
It’s the best of both worlds: your data is dynamic in nature, but you create static pages from it.
