+++

title = "React Native"
template = "notes.html"
description = "Notes on React Native"
draft = false

+++

## Core Components

- `<View>` | `<div>` A container that supports layout with flexbox, style, some touch handling, and accessibility controls
- `<Text>` | `<p>` Displays, styles, and nests strings of text and even handles touch events
- `<Image>` | <img>	Displays different types of images
- `<ScrollView>` | `<div>` A generic scrolling container that can contain multiple components and views
- `<TextInput>` | `<input type="text">`	Allows the user to enter text

## `<ScrollView>`

`ScrollView`s can be configured to allow **paging through views using swiping gestures** by using the `pagingEnabled` props. **Swiping horizontally** between views can also be implemented on **Android** using the `ViewPager` component.

On iOS a `ScrollView` **with a single item** can be used to allow the user to **zoom content**. Set up the `maximumZoomScale` and `minimumZoomScale` props and your user will be able to use pinch and expand gestures to zoom in and out.

The ScrollView works best to present a small number of things of a limited size. **All the elements and views of a ScrollView are rendered, even if they are not currently shown on the screen.** 

If you have a **long list** of items which **cannot fit on the screen**, you should use a `FlatList` instead. So let's learn about list views next.