# [Docker gnuplot](https://hub.docker.com/r/vidalmb/gnuplot/)

This is an Alpine Linux based Docker Container to run the latest version of [gnuplot](http://www.gnuplot.info).

The gnuplot softwware is installed from Alpine standard package.

Basic TTF fonts like Arial are also included, so the generated e.g. PNGs should look good and without any warnings.

## Usage

This image will call the `gnuplot` binary using `/work` as `WORKDIR`.

Map a local directory to `/work` provide either a `gnuplot` script or use the `-e` parameter to supply a "command list" as parameter (see the example section).

```
docker run --rm -v $(pwd):/work vidalmb/gnuplot your_file.gnu
```

## Example

In this example we will plot the CPU temperature previously registered in a datafile (temp_fan5v) with the following format: <hour> = <temperature>.

```

# generate the plot
docker run --rm -v $(pwd):/work vidalmb/gnuplot -e \
   "set xdata time;
   set timefmt '%H:%M:%S';
   set format x '%H:%M';
   set xrange ['11:20':'14:40'];
   set xlabel 'Hora';
   set ylabel 'Temperatura';
   set grid;
   set datafile separator '=';
   set term png size 800,380;
   set output 'cpu-temp.png';
   plot 'temp_fan5v' every 1 using 1:2 title 'Temperatura CPU' with lines linewidth 2;"

```

This will product a PNG file called `cpu-temp.png` in the `cwd`.

![CPU Temperature Example Plot](https://raw.githubusercontent.com/vidalmb/docker-gnuplot/master/example/cpu-temp.png)

## Debugging

To run a shell inside the container:

```
docker run --rm -it -v $(pwd):/work --entrypoint /bin/sh vidalmb/gnuplot
```

## Author

Vidal Mate (vidalmb at protonmail dot com)

## MIT License

See [LICENSE](LICENSE).
