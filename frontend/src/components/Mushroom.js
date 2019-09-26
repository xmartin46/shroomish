import React from 'react'
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions'
import CardContent from '@material-ui/core/CardContent'
import CardMedia from '@material-ui/core/CardMedia'
import Button from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'
const Mushroom = (props) => {
    console.log(props)
    return(
        <div>
            { props.props ? (
                <Card >
                    <CardMedia style={{height: 0, paddingTop: '56.25%'}}
                    image={props.mushroom.fields.mushroomImage.fields.file.url}
                    title={props.mushroom.fields.name}
                    />
                    <CardContent>
                    <Typography gutterBottom variant="headline" component="h2">
                        {props.mushroom.fields.name}
                    </Typography>
		    <Typography gutterBottom variant='headline' component="subtitle1">
                        {props.mushroom.fields.latin_name}
                    </Typography>
                    <Typography component="p">
                        {props.mushroom.fields.description}
                    </Typography>
                    </CardContent>
                    <CardActions>
                    <Button size="small" color="primary" href={props.mushroom.fields.url} target="_blank">
                        Know more...
                    </Button>
                    </CardActions>
                </Card>
            ) : null}
        </div>
    )
}
export default Mushroom
