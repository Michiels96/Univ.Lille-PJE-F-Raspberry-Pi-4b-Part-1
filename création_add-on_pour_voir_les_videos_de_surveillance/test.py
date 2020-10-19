import os
import re

#videoList = os.listdir("/media/usb0/record/")
videoList = []

for f in os.listdir("/media/usb0/record/"):
  if not f.startswith('.'):
      videoList.append(f)
print(videoList)
dates = []

for i in videoList:
  m = re.search('-([0-9]{8})', i)
  if m:
    dates.append(m.group(1))

seen = set()
datesUniques = []
for item in dates:
    if item not in seen:
        seen.add(item)
        datesUniques.append(item)


dates.sort()
datesUniques.sort()

count = 0
# for i in datesUniques:
#   jour = i[6:]
#   mois = i[4:6]
#   annee = i[0:4]
#   datesUniques[count] = str(jour)+"."+str(mois)+"."+str(annee)
#   count += 1

print(datesUniques)

vid = {}

for i in range(0, len(datesUniques)):
  vid[datesUniques[i]] = []
  for j in range(0, len(videoList)):
    if(datesUniques[i] in videoList[j]):
      jour = datesUniques[i][6:]
      mois = datesUniques[i][4:6]
      annee = datesUniques[i][0:4]
      date = str(jour)+"."+str(mois)+"."+str(annee)

      #vid[datesUniques[i]].append(
      vid[datesUniques[i]].append(
        {'name': videoList[j],
         'thumb': '',
         'video': '/media/usb0/record/'+videoList[j],
         'genre': date
        })

print(vid)


  

VIDEOS = {'recorded': [{'name': '10.Jours.Sans.Maman.2020',
                       'thumb': 'http://www.vidsplay.com/wp-content/uploads/2017/04/crab-screenshot.jpg',
                       'video': '/media/usb0/Films/10.Jours.Sans.Maman.2020/10.Jours.Sans.Maman.2020-trailer.mkv',
                       'genre': 'recorded'},
                      {'name': 'Alligator',
                       'thumb': 'http://www.vidsplay.com/wp-content/uploads/2017/04/alligator-screenshot.jpg',
                       'video': 'http://www.vidsplay.com/wp-content/uploads/2017/04/alligator.mp4',
                       'genre': 'recorded'},
                      {'name': 'Turtle',
                       'thumb': 'http://www.vidsplay.com/wp-content/uploads/2017/04/turtle-screenshot.jpg',
                       'video': 'http://www.vidsplay.com/wp-content/uploads/2017/04/turtle.mp4',
                       'genre': 'recorded'}
                      ]}

VIDEOS.update({'recorded': videoList})


