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
<<<<<<< HEAD
    <div className="computerContainer">
      <div className="screenContainer">
        <Graph
          gameState={@props.data.gameState}
          canvasWidth={800}
        />
      </div>
      <div className="shell-body">
        <span className="function">function: </span>
        <input type="text" className="inputExpression" valueLink={this.linkState('expression')} />
        <input className="button" type="submit" value="Fire" onClick={@fire} />
        <span id="turn-time">{@props.data.gameState.displayTurnTime}</span>
      </div>
=======
    <div>
      <Graph
        gameState={@props.data.gameState}
      />
      
      <p>Function:</p>
      <form>
        <input type="text" valueLink={this.linkState('expression')} />
        <input className='button black' type="submit" value="Fire" onClick={@fire} />
      </form>

      <p id="turn-time">Turn time: {@props.data.gameState.turnTime / 1000}</p>

>>>>>>> First stab at a CRT theme
    </div>
)