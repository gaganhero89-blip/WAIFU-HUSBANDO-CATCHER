class Config(object):
    LOGGER = True

    # Get this value from my.telegram.org/apps
    OWNER_ID = 8546535996
    sudo_users = 8053803602
    GROUP_ID = -1003727303409
    TOKEN = 8626222051:AAHNhAoKyaftc2xh5eK0Im0XEhMx1kb0jjg
    mongo_url = mongodb+srv://gagansiwan89_db_user:gagansiwan89@cluster0.vf66t20.mongodb.net/?appName=Cluster0
    PHOTO_URL = ["https://telegra.ph/file/b925c3985f0f325e62e17.jpg", "https://telegra.ph/file/4211fb191383d895dab9d.jpg"]
    SUPPORT_CHAT = Anime_InfinityChatGroup
    UPDATE_CHAT = Adambotupdates
    BOT_USERNAME = Waifugrabbberbot
    CHARA_CHANNEL_ID = -1003923346693
    api_id = 34224204
    api_hash = 0dfa074770803265e8c61ddda0ad6fb0


    
class Production(Config):
    LOGGER = True


class Development(Config):
    LOGGER = True
