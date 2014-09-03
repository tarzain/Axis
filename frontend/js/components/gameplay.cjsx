React = require('react/addons')
Game = require('../../../shared/game.coffee')
Graph = require('./graph.cjsx')
client = require('../client.coffee')

module.exports = React.createClass(
  mixins: [React.addons.LinkedStateMixin]

  getInitialState: ->
    {expression: 'sin(x)'}

  fire: (evt) ->
    client.pushMove(Game.fire(@state.expression))
    evt.preventDefault()

  render: ->
    <div className="computerContainer">
      <div className="screenContainer">
        <Graph
          gameState={@props.data.gameState}
          canvasWidth={800}
        />
      </div>
      <div className="shell-container">
        <div className="shell-body">
          <span className="function">$ function: </span>
          <form>
            <input type="text" className="inputExpression" valueLink={this.linkState('expression')} />
            <input className="button" type="submit" value="Fire" onClick={@fire} />
          </form>
          <span id="turn-time">{Math.floor(@props.data.gameState.turnTime/1000)}</span>
        </div>
      </div>
    </div>
)