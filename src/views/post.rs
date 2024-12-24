use loco_rs::prelude::*;

use crate::models::_entities::posts;

/// Render a list view of posts.
///
/// # Errors
///
/// When there is an issue with rendering the view.
pub fn list(v: &impl ViewRenderer, items: &Vec<posts::Model>) -> Result<Response> {
    format::render().view(v, "post/list.html", data!({"items": items}))
}

/// Render a single post view.
///
/// # Errors
///
/// When there is an issue with rendering the view.
pub fn show(v: &impl ViewRenderer, item: &posts::Model) -> Result<Response> {
    format::render().view(v, "post/show.html", data!({"item": item}))
}

/// Render a post create form.
///
/// # Errors
///
/// When there is an issue with rendering the view.
pub fn create(v: &impl ViewRenderer) -> Result<Response> {
    format::render().view(v, "post/create.html", data!({}))
}

/// Render a post edit form.
///
/// # Errors
///
/// When there is an issue with rendering the view.
pub fn edit(v: &impl ViewRenderer, item: &posts::Model) -> Result<Response> {
    format::render().view(v, "post/edit.html", data!({"item": item}))
}
