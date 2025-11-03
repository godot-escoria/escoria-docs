from docutils import nodes

def handle_missing_reference(app, env, node, contnode):
    """
    Handle unresolved {ref}`...` references in MyST/Sphinx.
    If a ref target cannot be resolved, substitute a link to
    fallback_ref_baseurl + target.
    """
    reftype = node.get("reftype")
    target = node.get("reftarget")

    if reftype == "ref" and target:
        base = app.config.fallback_ref_baseurl.lower()
        fallback_url = f"{base}{target}.html"

        refnode = nodes.reference(
            '',  # rawsource not needed
            '',  # no inner text, contnode supplies it
            internal=False,
            refuri=fallback_url,
            *[contnode]
        )

        if app.config.fallback_ref_newtab and app.config.fallback_ref_newtab.lower() != "n":
            refnode["target"] = "_blank"

        return refnode

    # Let Sphinx handle all other cases normally
    return None

def setup(app):
    app.add_config_value("fallback_ref_baseurl", "/fallback", "env")
    app.add_config_value("fallback_ref_newtab", "n", "env")
    app.connect("missing-reference", handle_missing_reference)
    return {
        "version": "0.1",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }

