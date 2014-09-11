React  = require('react/addons')
client = require('../client.coffee')
Game = require('../../../shared/game.coffee')

module.exports = React.createClass(
	mixins: [React.addons.LinkedStateMixin]

	getInitialState:->
		{message: "type a message"}

	sendMessage: (evt)->
		client.pushMove(Game.sendMessage(@state.message))
		evt.preventDefault()

	render: ->
		messages = @props.gameState.messages.map (message) ->
			<li className="message" key={message.time}>
				<span>{message.sender}</span>
				<span>{message.text}</span>
				<span>{message.time}</span>
			</li>
		<div className="sidebar">
			<div className="chats">
				<ul className="messageList">
					{messages}
				</ul>
			</div>
			<form id="chatbox">
				<input type="text" placeholder="type a message" valueLink = {this.linkState('message')} />
				<input type="submit" value="send" onClick ={@sendMessage} />
			</form>
		</div>
)