    CREATE DATABASE gaming;
    CREATE TABLE gamer(
        gamer_id INT PRIMARY KEY,
        username VARCHAR(30) UNIQUE NOT NULL,
        age INT,
        Gender BIT
    );
    CREATE TABLE games (
        game_id INT PRIMARY KEY,
        game_name VARCHAR(255) NOT NULL,
        game_dev VARCHAR(50) NOT NULL
    );

    CREATE TABLE teams (
        team_id INT PRIMARY KEY,
        team_name VARCHAR(255) NOT NULL
    );
    CREATE TABLE game_gamer (
        game_id INT,
        gamer_id INT,
        PRIMARY KEY (game_id, gamer_id),
        FOREIGN KEY (game_id) REFERENCES games(game_id),
        FOREIGN KEY (gamer_id) REFERENCES gamer(gamer_id),
        
    );
    CREATE TABLE gamer_teams (
        gamer_id INT,
        team_id INT,
        PRIMARY KEY (gamer_id, team_id),
        FOREIGN KEY (gamer_id) REFERENCES gamer(gamer_id),
        FOREIGN KEY (team_id) REFERENCES teams(team_id)
    );
    CREATE TABLE achievements (
        achievement_id VARCHAR(50) PRIMARY KEY,
        gamer_id INT,
        game_name VARCHAR(255),
        game_id INT,
        achievement_name VARCHAR(255),
        FOREIGN KEY (gamer_id) REFERENCES gamer(gamer_id),
        FOREIGN KEY (game_id) REFERENCES games(game_id),
    );
    CREATE TABLE gamer_social (
        gamer_id INT,
        social_link VARCHAR(255),
        FOREIGN KEY (gamer_id) REFERENCES gamer(gamer_id)
    );
    CREATE TABLE post(
        post_id INT PRIMARY KEY,
        gamer_id INT,
        des_post VARCHAR(320),
        date_post date
        FOREIGN KEY (gamer_id) REFERENCES gamer(gamer_id),
    );
    ALTER TABLE teams
    ADD num_participate INT CHECK (num_participate BETWEEN 2 AND 15);

    DROP TABLE achievements;
    CREATE TABLE gamer_achievements (
        gamer_id INT,
        achievement_id VARCHAR(50),
        PRIMARY KEY (gamer_id, achievement_id),
        FOREIGN KEY (gamer_id) REFERENCES gamer(gamer_id),
        FOREIGN KEY (achievement_id) REFERENCES achievements(achievement_id)
    );
    ALTER TABLE gamer ADD PASSWORD VARCHAR(50);
    SELECT *,
       CASE Gender
       WHEN 1 THEN 'Male'
       WHEN 0 THEN 'Female'
       FROM gamer;