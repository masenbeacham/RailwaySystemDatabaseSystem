# imports
import os
import discord
import database as db
import bot

# environment variables
token = os.environ['DISCORD_TOKEN']
server = os.environ['DISCORD_GUILD']
db_host = os.environ['DB_HOST']  
db_user = os.environ['DB_USER'] 
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']

db_instance = db.Database()
db_conn = db_instance.connect()
# database connection
# bot events
intents = discord.Intents.default()
client = discord.Client(intents=intents)


@client.event
async def on_ready():
    """
    This method triggers with the bot connects to the server
    Note that the sample implementation here only prints the
    welcome message on the IDE console, not on Discord
    :return: VOID
    """
    print("{} has joined the server".format(client.user.name))


@client.event
async def on_message(message):
    """
    This method triggers when a user sends a message in any of your Discord server channels
    :param message: the message from the user. Note that this message is passed automatically by the Discord API
    :return: VOID
    """
    if message.author == client.user:
        return # the message was sent by the bot

    msg = message
    response = bot.get_response(message)
        
    if response:
        # bot sends response to the Discord API and the response is show
        # on the channel from your Discord server that triggered this method.
        embed = discord.Embed(description=response)
        await message.channel.send(embed=embed)


try:
    # start the bot and keep the above methods listening for new events
    client.run(token)
except:
    print("Bot is offline because your secret environment variables are not set. Head to the left panel, " +
          "find the lock icon, and set your environment variables. For more details, read the README file in your " +
          "milestone 3 repository")
