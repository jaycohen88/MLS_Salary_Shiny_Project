from selenium import webdriver
import csv

# Open Chromdriver and go to first page to scrape
driver = webdriver.Chrome()
driver.implicitly_wait(10)
driver.get("https://www.fbref.com/en/comps/22/2798/2019-Major-League-Soccer-Stats")

# Start csv file
csv_file = open('MLS_points.csv', 'w', encoding='utf-8', newline='')
writer = csv.writer(csv_file)

# Click button to go to Squad Goalkeeping Table
squad_goalkeeping_button = driver.find_element_by_link_text('Squad Goalkeeping')
squad_goalkeeping_button.click()

# Scrape data from Squad Goalkeeping Table

# Scrape team names
# Find all elements containing team names
teams_2019_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
# Get list of team names
teams_2019 = []
for team19 in teams_2019_elements:
    print(team19.text)
    teams_2019.append(team19.text)

# Scrape matches played
matches_played_2019_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2019 = []
for matches19 in matches_played_2019_elements:
    print(matches19.text)
    matches_played_2019.append(matches19.text)

# Scrape wins
wins_2019_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2019 = []
for win19 in wins_2019_elements:
    print(win19.text)
    wins_2019.append(win19.text)

# Scrape draws
draws_2019_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2019 = []
for draw19 in draws_2019_elements:
    print(draw19.text)
    draws_2019.append(draw19.text)

# Scrape losses
losses_2019_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2019 = []
for loss19 in losses_2019_elements:
    print(loss19.text)
    losses_2019.append(loss19.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2018 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2018 season page

teams_2018_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2018 = []
for team18 in teams_2018_elements:
    print(team18.text)
    teams_2018.append(team18.text)

matches_played_2018_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2018 = []
for matches18 in matches_played_2018_elements:
    print(matches18.text)
    matches_played_2018.append(matches18.text)

wins_2018_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2018 = []
for win18 in wins_2018_elements:
    print(win18.text)
    wins_2018.append(win18.text)

draws_2018_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2018 = []
for draw18 in draws_2018_elements:
    print(draw18.text)
    draws_2018.append(draw18.text)

losses_2018_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2018 = []
for loss18 in losses_2018_elements:
    print(loss18.text)
    losses_2018.append(loss18.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2017 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2017 season page

teams_2017_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2017 = []
for team17 in teams_2017_elements:
    print(team17.text)
    teams_2017.append(team17.text)

matches_played_2017_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2017 = []
for matches17 in matches_played_2017_elements:
    print(matches17.text)
    matches_played_2017.append(matches17.text)

wins_2017_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2017 = []
for win17 in wins_2017_elements:
    print(win17.text)
    wins_2017.append(win17.text)

draws_2017_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2017 = []
for draw17 in draws_2017_elements:
    print(draw17.text)
    draws_2017.append(draw17.text)

losses_2017_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2017 = []
for loss17 in losses_2017_elements:
    print(loss17.text)
    losses_2017.append(loss17.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2016 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2016 season page

teams_2016_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2016 = []
for team16 in teams_2016_elements:
    print(team16.text)
    teams_2016.append(team16.text)

matches_played_2016_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2016 = []
for matches16 in matches_played_2016_elements:
    print(matches16.text)
    matches_played_2016.append(matches16.text)

wins_2016_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2016 = []
for win16 in wins_2016_elements:
    print(win16.text)
    wins_2016.append(win16.text)

draws_2016_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2016 = []
for draw16 in draws_2016_elements:
    print(draw16.text)
    draws_2016.append(draw16.text)

losses_2016_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2016 = []
for loss16 in losses_2016_elements:
    print(loss16.text)
    losses_2016.append(loss16.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2015 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2015 season page

teams_2015_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2015 = []
for team15 in teams_2015_elements:
    print(team15.text)
    teams_2015.append(team15.text)

matches_played_2015_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2015 = []
for matches15 in matches_played_2015_elements:
    print(matches15.text)
    matches_played_2015.append(matches15.text)

wins_2015_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2015 = []
for win15 in wins_2015_elements:
    print(win15.text)
    wins_2015.append(win15.text)

draws_2015_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2015 = []
for draw15 in draws_2015_elements:
    print(draw15.text)
    draws_2015.append(draw15.text)

losses_2015_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2015 = []
for loss15 in losses_2015_elements:
    print(loss15.text)
    losses_2015.append(loss15.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2014 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2014 season page

teams_2014_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2014 = []
for team14 in teams_2014_elements:
    print(team14.text)
    teams_2014.append(team14.text)

matches_played_2014_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2014 = []
for matches14 in matches_played_2014_elements:
    print(matches14.text)
    matches_played_2014.append(matches14.text)

wins_2014_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2014 = []
for win14 in wins_2014_elements:
    print(win14.text)
    wins_2014.append(win14.text)

draws_2014_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2014 = []
for draw14 in draws_2014_elements:
    print(draw14.text)
    draws_2014.append(draw14.text)

losses_2014_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2014 = []
for loss14 in losses_2014_elements:
    print(loss14.text)
    losses_2014.append(loss14.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2013 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2013 season page

teams_2013_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2013 = []
for team13 in teams_2013_elements:
    print(team13.text)
    teams_2013.append(team13.text)

matches_played_2013_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2013 = []
for matches13 in matches_played_2013_elements:
    print(matches13.text)
    matches_played_2013.append(matches13.text)

wins_2013_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2013 = []
for win13 in wins_2013_elements:
    print(win13.text)
    wins_2013.append(win13.text)

draws_2013_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2013 = []
for draw13 in draws_2013_elements:
    print(draw13.text)
    draws_2013.append(draw13.text)

losses_2013_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2013 = []
for loss13 in losses_2013_elements:
    print(loss13.text)
    losses_2013.append(loss13.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2012 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2012 season page

teams_2012_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2012 = []
for team12 in teams_2012_elements:
    print(team12.text)
    teams_2012.append(team12.text)

matches_played_2012_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2012 = []
for matches12 in matches_played_2012_elements:
    print(matches12.text)
    matches_played_2012.append(matches12.text)

wins_2012_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2012 = []
for win12 in wins_2012_elements:
    print(win12.text)
    wins_2012.append(win12.text)

draws_2012_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2012 = []
for draw12 in draws_2012_elements:
    print(draw12.text)
    draws_2012.append(draw12.text)

losses_2012_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2012 = []
for loss12 in losses_2012_elements:
    print(loss12.text)
    losses_2012.append(loss12.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2011 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2011 season page

teams_2011_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2011 = []
for team11 in teams_2011_elements:
    print(team11.text)
    teams_2011.append(team11.text)

matches_played_2011_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2011 = []
for matches11 in matches_played_2011_elements:
    print(matches11.text)
    matches_played_2011.append(matches11.text)

wins_2011_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2011 = []
for win11 in wins_2011_elements:
    print(win11.text)
    wins_2011.append(win11.text)

draws_2011_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2011 = []
for draw11 in draws_2011_elements:
    print(draw11.text)
    draws_2011.append(draw11.text)

losses_2011_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2011 = []
for loss11 in losses_2011_elements:
    print(loss11.text)
    losses_2011.append(loss11.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2010 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2010 season page

teams_2010_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2010 = []
for team10 in teams_2010_elements:
    print(team10.text)
    teams_2010.append(team10.text)

matches_played_2010_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2010 = []
for matches10 in matches_played_2010_elements:
    print(matches10.text)
    matches_played_2010.append(matches10.text)

wins_2010_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2010 = []
for win10 in wins_2010_elements:
    print(win10.text)
    wins_2010.append(win10.text)

draws_2010_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2010 = []
for draw10 in draws_2010_elements:
    print(draw10.text)
    draws_2010.append(draw10.text)

losses_2010_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2010 = []
for loss10 in losses_2010_elements:
    print(loss10.text)
    losses_2010.append(loss10.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2009 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2009 season page

teams_2009_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2009 = []
for team09 in teams_2009_elements:
    print(team09.text)
    teams_2009.append(team09.text)

matches_played_2009_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2009 = []
for matches09 in matches_played_2009_elements:
    print(matches09.text)
    matches_played_2009.append(matches09.text)

wins_2009_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2009 = []
for win09 in wins_2009_elements:
    print(win09.text)
    wins_2009.append(win09.text)

draws_2009_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2009 = []
for draw09 in draws_2009_elements:
    print(draw09.text)
    draws_2009.append(draw09.text)

losses_2009_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2009 = []
for loss09 in losses_2009_elements:
    print(loss09.text)
    losses_2009.append(loss09.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2008 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2008 season page

teams_2008_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2008 = []
for team08 in teams_2008_elements:
    print(team08.text)
    teams_2008.append(team08.text)

matches_played_2008_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2008 = []
for matches08 in matches_played_2008_elements:
    print(matches08.text)
    matches_played_2008.append(matches08.text)

wins_2008_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2008 = []
for win08 in wins_2008_elements:
    print(win08.text)
    wins_2008.append(win08.text)

draws_2008_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2008 = []
for draw08 in draws_2008_elements:
    print(draw08.text)
    draws_2008.append(draw08.text)

losses_2008_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2008 = []
for loss08 in losses_2008_elements:
    print(loss08.text)
    losses_2008.append(loss08.text)

# Scroll back to top of page for easier in-page navigation
driver.execute_script('window.scrollTo(0, 0)')

# Scroll back to top of page to go to prior year's data
driver.execute_script('window.scrollTo(0, 0)')

# Click button to go to 2007 data
previous_season_button = driver.find_element_by_link_text('Previous Season')
previous_season_button.click()

# Repeat for 2007 season page

teams_2007_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/th/a')
teams_2007 = []
for team07 in teams_2007_elements:
    print(team07.text)
    teams_2007.append(team07.text)

matches_played_2007_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[2]')
matches_played_2007 = []
for matches07 in matches_played_2007_elements:
    print(matches07.text)
    matches_played_2007.append(matches07.text)

wins_2007_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[10]')
wins_2007 = []
for win07 in wins_2007_elements:
    print(win07.text)
    wins_2007.append(win07.text)

draws_2007_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[11]')
draws_2007 = []
for draw07 in draws_2007_elements:
    print(draw07.text)
    draws_2007.append(draw07.text)

losses_2007_elements = driver.find_elements_by_xpath('.//div[@id="div_stats_keeper_squads"]/table/tbody/tr/td[12]')
losses_2007 = []
for loss07 in losses_2007_elements:
    print(loss07.text)
    losses_2007.append(loss07.text)

# Write to csv file
rows = (teams_2019, matches_played_2019, wins_2019, draws_2019, losses_2019, \
teams_2018, matches_played_2018, wins_2018, draws_2018, losses_2018, \
teams_2017, matches_played_2017, wins_2017, draws_2017, losses_2017, \
teams_2016, matches_played_2016, wins_2016, draws_2016, losses_2016, \
teams_2015, matches_played_2015, wins_2015, draws_2015, losses_2015, \
teams_2014, matches_played_2014, wins_2014, draws_2014, losses_2014, \
teams_2013, matches_played_2013, wins_2013, draws_2013, losses_2013, \
teams_2012, matches_played_2012, wins_2012, draws_2012, losses_2012, \
teams_2011, matches_played_2011, wins_2011, draws_2011, losses_2011, \
teams_2010, matches_played_2010, wins_2010, draws_2010, losses_2010, \
teams_2009, matches_played_2009, wins_2009, draws_2009, losses_2009, \
teams_2008, matches_played_2008, wins_2008, draws_2008, losses_2008, \
teams_2007, matches_played_2007, wins_2007, draws_2007, losses_2007)

for row in rows:
    writer.writerow(row)

csv_file.close()
driver.close()
