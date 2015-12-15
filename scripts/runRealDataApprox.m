
close all;

# ball machine
RealDataApprox('../data/BallMachine_Exp3_v2.txt',69,12.5/12,'flip');

figure(1);
title('Position Plot of Ball Machine');

figure(2);
title('Speed Plot of Ball Machine');
#ylim([0,200]);

figure(3);
title('Angle Plot of Ball Machine');

# Topspin
RealDataApprox('../data/Ryan_Topspin_Exp3_v2.txt',78-9,3,'dafs');

figure(4);
title('Position Plot of Topspin Groundstoke by Ryan Grindle');

figure(5);
title('Speed Plot of a Topspin Groundstoke by Ryan Grindle');
#ylim([0,200]);

figure(6);
title('Angle Plot of a Topspin Groundstoke by Ryan Grindle');

# Slice
RealDataApprox('../data/Ryan_Slice_Exp3_v2.txt',78-11,3,'f');

figure(7);
title('Position Plot of a Slice Groundstoke by Ryan Grindle');

figure(8);
title('Speed Plot of a Slice Groundstoke by Ryan Grindle');
#ylim([0,200]);

figure(9);
title('Angle Plot of a Slice Groundstoke by Ryan Grindle');
