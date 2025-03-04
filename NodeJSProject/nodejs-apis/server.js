const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

let items = [
    {name:"Forest", image:"assets/images/forest.jpg", rate:"5.0", location:"Thailand"},
    {name:"Fog", image:"assets/images/fog.jpg", rate:"5.0", location:"UK"},
    {name:"Fog in the Forest", image:"assets/images/fog2.jpg", rate:"4.0", location:"China"},
    {name:"Animal", image:"assets/images/bison.jpg", rate:"3.5", location:"Thailand"},
    {name:"Mountains", image:"assets/images/mountains.jpg", rate:"4.5", location:"Brazil"},
    {name:"Ocean", image:"assets/images/ocean.jpg", rate:"5.0", location:"Brazil"},
    {name:"WaterFall", image:"assets/images/waterfall.jpg", rate:"5.0", location:"Thai"},
    {name:"yellowstone", image:"assets/images/yellowstone.jpg", rate:"5.0", location:"US"},

    {name:"Alpine Car", image:"assets/images/alpine.jpg", rate:"2.5", location:"f1"},
    {name:"Aston Martin Car", image:"assets/images/aston.jpg", rate:"5.0", location:"f1"},
    {name:"Mercedes Car", image:"assets/images/mercedes.jpg", rate:"3.0", location:"f1"},
    {name:"Red Bull Car", image:"assets/images/redbull.jpg", rate:"0.5", location:"f1"},
];


app.get('/items',(req,res) => {
    res.json(items);
});

app.get('/items/:name', (req, res) => {
    const item = items.find(i => i.name == req.params.name);
    res.json(item);
});

app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});

//\NodeJSProject\nodejs-apis> npm start