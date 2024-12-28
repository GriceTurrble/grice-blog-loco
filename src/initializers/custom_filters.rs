use std::collections::HashMap;

use markdown;
use tera::{from_value, to_value, Error, Result, Value};

/// Tera template filter `markdown`, for converting Markdown-formatted prose to HTML.
pub fn filter_markdown(value: &Value, _: &HashMap<String, Value>) -> Result<Value> {
    let val = match from_value::<String>(value.clone()) {
        Ok(s) => s,
        Err(_) => return Err(Error::msg("Failed to render `markdown` filter")),
    };

    Ok(to_value(markdown::to_html(val.as_str())).unwrap())
}
