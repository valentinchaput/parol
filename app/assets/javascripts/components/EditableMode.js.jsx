var EditableMode = React.createClass({
  render: function() {
    return (
        <div className="new-amendment col-xs-5 hidden">
          <div className="initial-selection">
            <p><span></span></p>
          </div>
          <a className= 'btn btn-text-replace btn-success'>
            <i className="fa fa-download"></i> Déposer un amendement
          </a>
            <div className="form-container">
              <form novalidate="novalidate" className="simple_form new_amendment" id="new_amendment" action="/amendments" accept-charset="UTF-8" method="post">
              <input name="utf8" type="hidden" value="✓" />
              <input type="hidden" name="authenticity_token" value="e72uc6wgasjr/yRWKQs5Mc0I+1BUb6XFpW0mFW8q3xrPP9J/JvUjynPhRxNQ1TjjHHVjdnYVIDvXM+Twk7Ybzw==" />
              <div className="form-group text required amendment_content">
                <label className="text required control-label" for="amendment_content">
                  Est remplacé par :
                </label>

                <textarea className="text required form-control" name="amendment[content]" id="amendment_content">
                </textarea>
              </div>

                <div className="form-group text required amendment_object">
                  <label className="text required control-label" for="amendment_object">
                    Exposé des motifs :
                  </label>
                  <textarea className="text required form-control" name="amendment[object]" id="amendment_object">
                  </textarea>
                </div>

                <ul className="list-inline text-center">
                  <li>
                    <input type="submit" name="commit" value="Enregistrer" className="btn btn-default center-block btn btn-success" />
                  </li>

                  <li>
                    <button name="button" type="reset" className="cancel center-block btn btn-danger">Annuler</button>
                  </li>
                </ul>
              </form>
          </div>
        </div>
    )
  }
})